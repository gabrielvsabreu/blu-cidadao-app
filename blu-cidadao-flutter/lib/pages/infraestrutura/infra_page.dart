import 'package:blu_cidadao/pages/infraestrutura/infra_service.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const Color blueColor1 = Color(0xFF006df0);
const Color iceWhiteColor = Color(0xFFF5F9FF);

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
              label: Text(
                servico.nome,
                style: const TextStyle(color: iceWhiteColor),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: blueColor1,
              ),
            );
          },
        ),
      ),
    );
  }
}
