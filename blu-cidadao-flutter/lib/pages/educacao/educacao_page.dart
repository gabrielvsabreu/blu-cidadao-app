import 'package:blu_cidadao/common/constants/app_colors.dart';
import 'package:blu_cidadao/pages/educacao/escolas_eja_page.dart';
import 'package:blu_cidadao/pages/educacao/escolas_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EducacaoPage extends StatelessWidget {
  const EducacaoPage({super.key});

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
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  _buildServicoCard(
                    context,
                    titulo: 'Ensino Fundamental e Médio',
                    subtitulo:
                        'Matriculas, intenção de vaga e convocações para as vagas do Ensio Fundamental e Médio',
                    icone: Icons.school,
                    destino: EscolasPage(
                      titulo: 'Escolas do Ensino Fundamental e Médio',
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildServicoCard(
                    context,
                    titulo: 'EJA - Educação de Jovens e Adultos',
                    subtitulo: 'Matrícula na Educação de Jovens e Adultos',
                    icone: Icons.people_alt,
                    destino: EscolasEjaPage(
                      titulo: 'EJA - Educação de Jovens e Adultos',
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
        height: 160,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: AppColors.borderColor.withOpacity(0.3),
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
