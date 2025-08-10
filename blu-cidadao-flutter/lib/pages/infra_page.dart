import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/infra_service.dart';

class InfraestruturaPage extends StatelessWidget {
  const InfraestruturaPage({super.key});

  Future<void> _abrirUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Não foi possível abrir: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final servicos = InfraServiceData.getServicos();

    return Scaffold(
      appBar: AppBar(title: const Text('Infraestrutura')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: servicos.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final servico = servicos[index];
            return ElevatedButton.icon(
              onPressed: () => _abrirUrl(servico.url),
              icon: const Icon(Icons.open_in_browser),
              label: Text(servico.nome),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
            );
          },
        ),
      ),
    );
  }
}
