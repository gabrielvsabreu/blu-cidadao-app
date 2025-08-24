import 'package:blu_cidadao/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'detran_lista_page.dart';
import 'detran_service.dart';

class VeiculosHomePage extends StatelessWidget {
  const VeiculosHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // transparente sempre
        statusBarIconBrightness: Brightness.light, // Android: ícones brancos
        statusBarBrightness: Brightness.dark, // iOS: texto branco
      ),
      child: Scaffold(
        backgroundColor: AppColors.iceWhiteColor,
        body: Column(
          children: [
            Container(
              height: 120, // dobro da altura anterior
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
                      'DETRAN-SC',
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
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  _buildServicoCard(
                    context,
                    titulo: 'HABILITAÇÃO',
                    subtitulo: 'Gerencie sua CNH e serviços do condutor',
                    icone: Icons.person,
                    destino: VeiculosListaPage(
                      titulo: 'Habilitação',
                      servicos: VeiculosServiceData.getHabilitacao(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildServicoCard(
                    context,
                    titulo: 'VEÍCULOS',
                    subtitulo: 'Acesse CRLV-e, venda digital e mais',
                    icone: Icons.directions_car,
                    destino: VeiculosListaPage(
                      titulo: 'Veículos',
                      servicos: VeiculosServiceData.getVeiculos(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildServicoCard(
                    context,
                    titulo: 'INFRAÇÕES',
                    subtitulo: 'Visualize e pague multas com desconto',
                    icone: Icons.report,
                    destino: Builder(
                      builder: (context) {
                        final uri = Uri.parse(
                          'https://www.detran.sc.gov.br/infracoes/',
                        );
                        launchUrl(uri, mode: LaunchMode.externalApplication);
                        Future.microtask(() => Navigator.pop(context));
                        return const Scaffold(
                          body: Center(child: CircularProgressIndicator()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServicoCard(
    BuildContext context, {
    required String titulo,
    required String subtitulo,
    required IconData icone,
    required Widget destino,
  }) {
    return InkWell(
      onTap: () =>
          Navigator.push(context, MaterialPageRoute(builder: (_) => destino)),
      child: Container(
        height: 120, // dobro da altura anterior
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2, // 2/3 para texto
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      color: AppColors.blueColor1,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    subtitulo,
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
              flex: 1, // 1/3 para ícone
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(icone, color: AppColors.blueColor1, size: 48),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
