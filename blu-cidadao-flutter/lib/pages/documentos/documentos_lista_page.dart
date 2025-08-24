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
    final consultaItem = documentos.firstWhere(
      (doc) => doc.nome == 'Consulta e emissão',
      orElse: () => DocumentoModel(nome: '', url: ''),
    );

    final outrosDocumentos = documentos
        .where((doc) => doc.nome != 'Consulta e emissão')
        .toList();

    return Scaffold(
      backgroundColor: AppColors.iceWhiteColor,
      body: Column(
        children: [
          // 🔹 Cabeçalho azul
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
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 🔹 Conteúdo
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  // 🔹 Consulta e emissão
                  if (titulo == 'Título de Eleitor' &&
                      consultaItem.nome.isNotEmpty)
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Acesse o serviço de consulta e emissão do Título de Eleitor.',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: AppColors.blueColor1,
                            ),
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton.icon(
                            onPressed: () => _abrirUrl(consultaItem.url),
                            icon: const Icon(Icons.link),
                            label: const Text('Ir para Consulta e Emissão'),
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

                  if (titulo == 'Título de Eleitor') const SizedBox(height: 16),

                  // 🔹 Emissão do Título
                  if (titulo == 'Título de Eleitor')
                    Container(
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
                              fontWeight: FontWeight.normal,
                              color: AppColors.blueColor1,
                            ),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton.icon(
                            onPressed: () async {
                              const pdfUrl =
                                  'https://drive.google.com/file/d/1bvTB3ekYzaROsK9IWmc09qEF4_qUpPYQ/view?usp=sharing';
                              final uri = Uri.parse(pdfUrl);
                              final success = await launchUrl(
                                uri,
                                mode: LaunchMode.externalApplication,
                              );
                              if (!success) {
                                throw Exception(
                                  'Não foi possível abrir o PDF.',
                                );
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

                  if (titulo == 'Título de Eleitor') const SizedBox(height: 16),

                  // 🔹 Requerimentos diversos
                  if (titulo == 'Título de Eleitor')
                    Container(
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
                              fontWeight: FontWeight.normal,
                              color: AppColors.blueColor1,
                            ),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton.icon(
                            onPressed: () async {
                              const pdfUrl =
                                  'https://drive.google.com/file/d/1Nj0tvmgkcVZcRFiDGw6pST0nQpp6qaJa/view?usp=sharing';
                              final uri = Uri.parse(pdfUrl);
                              final success = await launchUrl(
                                uri,
                                mode: LaunchMode.externalApplication,
                              );
                              if (!success) {
                                throw Exception(
                                  'Não foi possível abrir o PDF.',
                                );
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

                  if (titulo == 'Título de Eleitor') const SizedBox(height: 16),

                  // 🔹 Lista de documentos em formato de quadrados
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: outrosDocumentos.map((documento) {
                      return Material(
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(16),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16),
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () => _abrirUrl(documento.url),
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              documento.nome,
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
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
