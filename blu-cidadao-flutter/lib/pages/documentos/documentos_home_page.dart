import 'package:blu_cidadao/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:blu_cidadao/pages/documentos/documentos_lista_page.dart';
import 'package:blu_cidadao/pages/documentos/documentos_service.dart';
import 'package:url_launcher/url_launcher.dart';

class DocumentosHomePage extends StatelessWidget {
  const DocumentosHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    'Documentos',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: AppColors.iceWhiteColor,
                      fontSize: 20,
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
                _buildCard(
                  context,
                  titulo: 'Documento de Identidade - RG',
                  subtitulo: 'Emissão e Segunda Via',
                  icone: Icons.badge,
                  destino: Builder(
                    builder: (context) {
                      final uri = Uri.parse(
                        'https://www.policiacientifica.sc.gov.br/carteira-de-identidade/',
                      );
                      launchUrl(uri, mode: LaunchMode.externalApplication);
                      Future.microtask(() => Navigator.pop(context));
                      return const Scaffold(
                        body: Center(child: CircularProgressIndicator()),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                _buildCard(
                  context,
                  titulo: 'Cadastro de Pessoa Física - CPF',
                  subtitulo: 'Cadastro e Regularização',
                  icone: Icons.credit_card,
                  destino: DocumentosListaPage(
                    titulo: 'CPF',
                    documentos: DocumentosServiceData.getCPF(),
                  ),
                ),
                const SizedBox(height: 16),
                _buildCard(
                  context,
                  titulo: 'CTPS',
                  subtitulo: 'Carteira de Trabalho e Previdência Social',
                  icone: Icons.work,
                  destino: Builder(
                    builder: (context) {
                      final uri = Uri.parse(
                        'https://www.gov.br/pt-br/servicos/obter-a-carteira-de-trabalho',
                      );
                      launchUrl(uri, mode: LaunchMode.externalApplication);
                      Future.microtask(() => Navigator.pop(context));
                      return const Scaffold(
                        body: Center(child: CircularProgressIndicator()),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                _buildCard(
                  context,
                  titulo: 'Título de Eleitor',
                  subtitulo: 'Consulta e Regularização',
                  icone: Icons.how_to_vote,
                  destino: DocumentosListaPage(
                    titulo: 'Título de Eleitor',
                    documentos: DocumentosServiceData.getTitulo(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
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
        height: 120,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
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
              flex: 1,
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
