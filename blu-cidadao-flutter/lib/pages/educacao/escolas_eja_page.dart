import 'package:blu_cidadao/common/constants/app_colors.dart';
import 'package:blu_cidadao/pages/educacao/escola_detalhes_page.dart';
import 'package:blu_cidadao/pages/educacao/escolas.dart';
import 'package:blu_cidadao/pages/educacao/escolas_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EscolasEjaPage extends StatefulWidget {
  const EscolasEjaPage({super.key, required String titulo});

  @override
  State<EscolasEjaPage> createState() => _EscolasEjaPageState();
}

class _EscolasEjaPageState extends State<EscolasEjaPage> {
  final EscolaService service = EscolaService();

  List<Escola> escolasEja = [];
  List<Escola> escolasFiltradas = [];

  String termoBusca = '';
  bool carregando = true;
  String? erro;

  @override
  void initState() {
    super.initState();
    carregarEscolasEja();
  }

  Future<void> carregarEscolasEja() async {
    setState(() {
      carregando = true;
      erro = null;
    });

    try {
      final todasEscolas = await service.fetchEscolas();
      final apenasEja = todasEscolas.where((e) => e.edEJA == true).toList();

      apenasEja.sort(
        (a, b) => a.nome.toLowerCase().compareTo(b.nome.toLowerCase()),
      );

      setState(() {
        escolasEja = apenasEja;
        aplicarFiltroBusca();
        carregando = false;
      });
    } catch (e) {
      setState(() {
        erro = 'Erro ao carregar escolas com EJA: $e';
        carregando = false;
      });
    }
  }

  void aplicarFiltroBusca() {
    setState(() {
      escolasFiltradas = escolasEja
          .where((e) => e.nome.toLowerCase().contains(termoBusca.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // transparente sempre
        statusBarIconBrightness: Brightness.light, // Android: ícones brancos
        statusBarBrightness: Brightness.dark, // iOS: texto branco
      ),
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 120,
              color: AppColors.blueColor1,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.iceWhiteColor,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Escolas com EJA',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: AppColors.iceWhiteColor,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: AppColors.borderColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Text(
                'Veja as escolas que oferecem Educação de Jovens e Adultos (EJA) em Blumenau.',
                style: TextStyle(fontSize: 16, color: AppColors.blueColor1),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar escola...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onChanged: (value) {
                  termoBusca = value;
                  aplicarFiltroBusca();
                },
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: carregando
                    ? const Center(child: CircularProgressIndicator())
                    : erro != null
                    ? Center(child: Text(erro!))
                    : escolasFiltradas.isEmpty
                    ? const Center(
                        child: Text('Nenhuma escola com EJA encontrada.'),
                      )
                    : ListView.builder(
                        itemCount: escolasFiltradas.length,
                        itemBuilder: (context, index) {
                          final escola = escolasFiltradas[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            elevation: 2,
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EscolaDetalhesPage(escola: escola),
                                  ),
                                );
                              },
                              leading: const Icon(Icons.school),
                              iconColor: AppColors.blueColor1,
                              title: Text(
                                escola.nome,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.blueColor1,
                                ),
                              ),
                              subtitle: Text(escola.categoria),
                            ),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
