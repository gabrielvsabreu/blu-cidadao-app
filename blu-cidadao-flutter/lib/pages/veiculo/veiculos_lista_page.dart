import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'veiculos_model.dart';

class VeiculosListaPage extends StatelessWidget {
  final String titulo;
  final List<VeiculoService> servicos;

  const VeiculosListaPage({super.key, required this.titulo, required this.servicos});

  Future<void> _abrirUrl(String url) async {
    final uri = Uri.parse(url);
    final success = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!success) throw Exception('Não foi possível abrir: $url');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titulo)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: servicos.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final servico = servicos[index];
            return ElevatedButton.icon(
              icon: const Icon(Icons.open_in_new),
              label: Text(servico.nome),
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
              onPressed: () => _abrirUrl(servico.url),
            );
          },
        ),
      ),
    );
  }
}
