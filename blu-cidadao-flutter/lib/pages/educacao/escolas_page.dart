import 'package:blu_cidadao/common/constants/app_colors.dart';
import 'package:blu_cidadao/pages/educacao/escola_detalhes_page.dart';
import 'package:blu_cidadao/pages/educacao/escolas.dart';
import 'package:blu_cidadao/pages/educacao/escolas_service.dart';
import 'package:flutter/material.dart';

class EscolasPage extends StatefulWidget {
  final String titulo;
  const EscolasPage({super.key, required this.titulo});

  @override
  State<EscolasPage> createState() => _EscolasPageState();
}

class _EscolasPageState extends State<EscolasPage> {
  final EscolaService service = EscolaService();

  List<Escola> escolas = [];
  List<Escola> escolasFiltradas = [];
  List<String> dependencias = [];
  List<String> categorias = [];

  String? dependenciaSelecionada;
  String? categoriaSelecionada;
  String termoBusca = '';

  bool carregando = true;
  String? erro;

  @override
  void initState() {
    super.initState();
    carregarFiltros();
  }

  Future<void> carregarFiltros() async {
    try {
      final opcoes = await service.fetchOpcoes();
      setState(() {
        dependencias = List<String>.from(opcoes['dependencias'] ?? []);
        categorias = List<String>.from(opcoes['categorias'] ?? []);
      });
      await carregarEscolas();
    } catch (e) {
      if (mounted) {
        setState(() {
          erro = 'Erro ao carregar filtros: $e';
          carregando = false;
        });
      }
    }
  }

  Future<void> carregarEscolas() async {
    setState(() {
      carregando = true;
      erro = null;
    });
    try {
      final resultado = await service.fetchEscolas(
        dependencia: dependenciaSelecionada,
        categoria: categoriaSelecionada,
      );

      resultado.sort(
        (a, b) => a.nome.toLowerCase().compareTo(b.nome.toLowerCase()),
      );

      setState(() {
        escolas = resultado;
        aplicarFiltroBusca();
        carregando = false;
      });
    } catch (e) {
      setState(() {
        erro = 'Erro ao carregar escolas: $e';
        carregando = false;
      });
    }
  }

  void aplicarFiltroBusca() {
    setState(() {
      escolasFiltradas = escolas
          .where((e) => e.nome.toLowerCase().contains(termoBusca.toLowerCase()))
          .toList();
    });
  }

  Widget buildDropdown(
    String label,
    List<String> items,
    String? value,
    Function(String?) onChanged,
  ) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(labelText: label),
      items: items
          .map((item) => DropdownMenuItem(value: item, child: Text(item)))
          .toList(),
      onChanged: (val) {
        onChanged(val);
        carregarEscolas();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    'Escolas',
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
              'Encontre escolas da Educação Básica em Blumenau. Use o filtro para escolher onde matricular seu filho.',
              style: TextStyle(fontSize: 16, color: AppColors.blueColor1),
              textAlign: TextAlign.center,
            ),
          ),

          // 🔍 Campo de busca acima da caixa de seleção
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
              child: Column(
                children: [
                  if (dependencias.isNotEmpty)
                    buildDropdown(
                      'Dependência',
                      dependencias,
                      dependenciaSelecionada,
                      (val) => setState(() => dependenciaSelecionada = val),
                    ),
                  const SizedBox(height: 12),
                  if (carregando)
                    const Expanded(
                      child: Center(child: CircularProgressIndicator()),
                    )
                  else if (erro != null)
                    Expanded(child: Center(child: Text(erro!)))
                  else if (escolasFiltradas.isEmpty)
                    const Expanded(
                      child: Center(child: Text('Nenhuma escola encontrada.')),
                    )
                  else
                    Expanded(
                      child: ListView.builder(
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
