import 'package:blu_cidadao/pages/escolas/escolas.dart';
import 'package:blu_cidadao/pages/escolas/escolas_service.dart';
import 'package:flutter/material.dart';

class EscolasPage extends StatelessWidget {
  final EscolaService service = EscolaService();

  EscolasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Escolas em Blumenau e região')),
      body: FutureBuilder<List<Escola>>(
        future: service.fetchEscolas(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhuma escola encontrada.'));
          }

          final escolas = snapshot.data!;
          return ListView.builder(
            itemCount: escolas.length,
            itemBuilder: (context, index) {
              final escola = escolas[index];
              return ListTile(
                title: Text(escola.nome),
                subtitle: Text(escola.municipio),
                trailing: Text(escola.tipo),
              );
            },
          );
        },
      ),
    );
  }
}
