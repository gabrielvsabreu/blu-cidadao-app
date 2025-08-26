import 'package:blu_cidadao/common/constants/app_colors.dart';
import 'package:blu_cidadao/pages/infraestrutura/infra_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

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

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // transparente sempre
        statusBarIconBrightness: Brightness.light, // Android: ícones brancos
        statusBarBrightness: Brightness.dark, // iOS: texto branco
      ),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
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
                        color: AppColors.whiteColor,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Água, Esgoto e Energia',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: AppColors.whiteColor,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(20),
                itemCount: servicos.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final servico = servicos[index];
                  return InkWell(
                    onTap: () => _abrirUrl(servico.url),
                    child: Container(
                      height: 120,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      decoration: BoxDecoration(
                        color: AppColors.borderColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  servico.nome,
                                  style: const TextStyle(
                                    fontFamily: 'Inter',
                                    color: AppColors.blueColor1,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  servico.subtitulo,
                                  style: const TextStyle(
                                    fontFamily: 'Inter',
                                    color: AppColors.blueColor1,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                servico.nome.toLowerCase().contains('samae')
                                    ? Icons.water_drop
                                    : servico.nome.toLowerCase().contains(
                                        'celesc',
                                      )
                                    ? Icons.bolt
                                    : Icons.construction,
                                color: AppColors.blueColor1,
                                size: 48,
                              ),
                            ),
                          ),
                        ],
                      ),
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
