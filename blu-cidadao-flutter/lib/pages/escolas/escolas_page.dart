import 'package:flutter/material.dart';
import 'package:blu_cidadao/pages/escolas/escolas.dart';
import 'package:blu_cidadao/pages/escolas/escolas_service.dart';

class EscolasPage extends StatefulWidget {
  const EscolasPage({super.key});

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
        municipios = opcoes['municipios']!;
        redes = opcoes['redes']!;
        categorias = opcoes['etapas']!;
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
        etapa: categoriaSelecionada,
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

  Color corRede(String tipo) {
    switch (tipo) {
      case '1':
        return Colors.red;
      case '2':
        return Colors.green;
      case '3':
        return Colors.blue;
      case '4':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  String nomeRede(String tipo) {
    switch (tipo) {
      case '1':
        return 'Federal';
      case '2':
        return 'Estadual';
      case '3':
        return 'Municipal';
      case '4':
        return 'Privada';
      default:
        return 'Desconhecida';
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
      appBar: AppBar(title: const Text('Escolas em Blumenau e região')),
      body: Padding(
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
              const Expanded(child: Center(child: CircularProgressIndicator()))
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
                        leading: Icon(
                          Icons.school,
                          color: corRede(escola.tipo),
                        ),
                        title: Text(
                          escola.nome,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(escola.municipio),
                        trailing: Text(nomeRede(escola.tipo)),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
