import 'package:flutter/material.dart';
import '../models/educacao_model.dart';
import '../models/educacao_service.dart';

class EducacaoPage extends StatefulWidget {
  const EducacaoPage({super.key});

  @override
  State<EducacaoPage> createState() => _EducacaoPageState();
}

class _EducacaoPageState extends State<EducacaoPage> {
  String tipoSelecionado = 'municipal';
  List<EducacaoModel> todasEscolas = [];
  bool carregando = true;

  @override
  void initState() {
    super.initState();
    carregarEscolas();
  }

  Future<void> carregarEscolas() async {
    try {
      final escolas = await EducacaoService().buscarEscolas();

      // LOG: para verificar se os dados estão vindo
      print('Total de escolas carregadas: ${escolas.length}');

      // LOG: Ver alguns dados de exemplo
      if (escolas.isNotEmpty) {
        print(
          'Primeira escola da API INEP: ${escolas.first.nome}, '
          'tipo: ${escolas.first.tipo}, cidade: ${escolas.first.municipio}, '
          'nota: ${escolas.first.nota}',
        );
      }

      setState(() {
        todasEscolas = escolas
            .where((e) => e.municipio.trim().toLowerCase() == 'blumenau')
            .toList();

        carregando = false;
      });

      print('Escolas em Blumenau: ${todasEscolas.length}');
    } catch (e) {
      print('Erro ao carregar escolas: $e');
      setState(() {
        carregando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final escolasFiltradas = todasEscolas
        .where((e) => e.tipo == tipoSelecionado)
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Educação')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: carregando
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _botaoFiltro('municipal', 'Municipal'),
                      _botaoFiltro('estadual', 'Estadual'),
                      _botaoFiltro('privada', 'Privada'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: escolasFiltradas.isEmpty
                        ? const Center(
                            child: Text('Nenhuma escola encontrada.'),
                          )
                        : ListView.builder(
                            itemCount: escolasFiltradas.length,
                            itemBuilder: (context, index) {
                              final escola = escolasFiltradas[index];
                              return _cardEscola(escola);
                            },
                          ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _botaoFiltro(String tipo, String label) {
    final isSelected = tipoSelecionado == tipo;

    return ElevatedButton(
      onPressed: () {
        setState(() {
          tipoSelecionado = tipo;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue : Colors.grey[300],
        foregroundColor: isSelected ? Colors.white : Colors.black,
      ),
      child: Text(label),
    );
  }

  Widget _cardEscola(EducacaoModel escola) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              escola.nome,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text('Cidade: ${escola.municipio}'),
            const SizedBox(height: 4),
            Text(
              escola.nota ?? 'Nota não informada',
              style: const TextStyle(color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
