import 'package:blu_cidadao/common/constants/app_colors.dart';
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
  List<String> municipios = [];
  List<String> redes = [];
  List<String> categorias = [];

  String? municipioSelecionado;
  String? redeSelecionada;
  String? categoriaSelecionada;

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
        municipios = List<String>.from(opcoes['municipios'] ?? []);
        redes = List<String>.from(opcoes['redes'] ?? []);
        categorias = List<String>.from(opcoes['categorias'] ?? []);
      });
      await carregarEscolas();
    } catch (e) {
      setState(() {
        erro = 'Erro ao carregar filtros: $e';
        carregando = false;
      });
    }
  }

  Future<void> carregarEscolas() async {
    setState(() {
      carregando = true;
      erro = null;
    });
    try {
      final resultado = await service.fetchEscolas(
        municipio: municipioSelecionado,
        rede: redeSelecionada,
        categoria: categoriaSelecionada,
      );
      setState(() {
        escolas = resultado;
        carregando = false;
      });
    } catch (e) {
      setState(() {
        erro = 'Erro ao carregar escolas: $e';
        carregando = false;
      });
    }
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
                    'Educação',
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
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              'Encontre escolas da Educação Básica em Blumenau e região. Use os filtros para escolher se matricular.',
              style: TextStyle(fontSize: 16, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  if (municipios.isNotEmpty)
                    buildDropdown(
                      'Município',
                      municipios,
                      municipioSelecionado,
                      (val) => setState(() => municipioSelecionado = val),
                    ),
                  if (redes.isNotEmpty)
                    buildDropdown(
                      'Rede',
                      redes,
                      redeSelecionada,
                      (val) => setState(() => redeSelecionada = val),
                    ),
                  if (categorias.isNotEmpty)
                    buildDropdown(
                      'Categoria',
                      categorias,
                      categoriaSelecionada,
                      (val) => setState(() => categoriaSelecionada = val),
                    ),
                  const SizedBox(height: 12),
                  if (carregando)
                    const Expanded(
                      child: Center(child: CircularProgressIndicator()),
                    )
                  else if (erro != null)
                    Expanded(child: Center(child: Text(erro!)))
                  else if (escolas.isEmpty)
                    const Expanded(
                      child: Center(child: Text('Nenhuma escola encontrada.')),
                    )
                  else
                    Expanded(
                      child: ListView.builder(
                        itemCount: escolas.length,
                        itemBuilder: (context, index) {
                          final escola = escolas[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            elevation: 2,
                            child: ListTile(
                              leading: Icon(Icons.school),
                              title: Text(
                                escola.nome,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(escola.municipio),
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
