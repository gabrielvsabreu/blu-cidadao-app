import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:blu_cidadao/common/constants/app_colors.dart';
import 'documentos_model.dart';

class DocumentosListaPage extends StatelessWidget {
  final String titulo;
  final List<DocumentoModel> documentos;

  const DocumentosListaPage({
    super.key,
    required this.titulo,
    required this.documentos,
  });

  Future<void> _abrirUrl(String url) async {
    final uri = Uri.parse(url);
    final success = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!success) throw Exception('Não foi possível abrir: $url');
  }

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
                  Text(
                    titulo,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      color: AppColors.iceWhiteColor,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 🔹 Caixa 1: Emissão do Título de Eleitor
          if (titulo == 'Título de Eleitor')
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Passo a passo para emissão do Título de Eleitor.',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blueColor1,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () async {
                        const pdfUrl =
                            'https://www.exemplo.com/emissao-titulo.pdf'; // ⬅️ Substitua pelo link real
                        final uri = Uri.parse(pdfUrl);
                        final success = await launchUrl(
                          uri,
                          mode: LaunchMode.externalApplication,
                        );
                        if (!success) {
                          throw Exception('Não foi possível abrir o PDF.');
                        }
                      },
                      icon: const Icon(Icons.download),
                      label: const Text('Baixar PDF de Emissão'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blueColor1,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // 🔹 Caixa 2: Requerimentos diversos ao TRE/SC
          if (titulo == 'Título de Eleitor')
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Passo a passo para requerimentos diversos ao TRE/SC.',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blueColor1,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () async {
                        const pdfUrl =
                            'https://www.exemplo.com/requerimentos-tre.pdf'; // ⬅️ Substitua pelo link real
                        final uri = Uri.parse(pdfUrl);
                        final success = await launchUrl(
                          uri,
                          mode: LaunchMode.externalApplication,
                        );
                        if (!success) {
                          throw Exception('Não foi possível abrir o PDF.');
                        }
                      },
                      icon: const Icon(Icons.download),
                      label: const Text('Baixar PDF de Requerimentos'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blueColor1,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // 🔹 Lista de documentos
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: documentos.length,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final doc = documentos[index];
                return Material(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(16),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () => _abrirUrl(doc.url),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        doc.nome,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blueColor1,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
