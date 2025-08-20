import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
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

  /// Salva o PDF dos assets na pasta Downloads
  Future<void> _salvarPdf(
    BuildContext context,
    String assetPath,
    String nomeArquivo,
  ) async {
    try {
      // Carrega o PDF da pasta assets
      final byteData = await rootBundle.load(assetPath);

      // Caminho padrão para a pasta Downloads no Android
      final downloadsDir = Directory('/storage/emulated/0/Download');

      File file;
      if (downloadsDir.existsSync()) {
        file = File('${downloadsDir.path}/$nomeArquivo');
      } else {
        // Fallback -> usa pasta interna do app
        final dir = await getApplicationDocumentsDirectory();
        file = File('${dir.path}/$nomeArquivo');
      }

      // Salva o arquivo
      await file.writeAsBytes(byteData.buffer.asUint8List());

      // Mensagem de sucesso
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('PDF "$nomeArquivo" salvo em ${file.parent.path}'),
          duration: const Duration(seconds: 2),
        ),
      );
    } catch (e) {
      debugPrint('Erro ao salvar PDF: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Erro ao salvar PDF'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.iceWhiteColor,
      body: Column(
        children: [
          // Cabeçalho
          Container(
            height: 120,
            color: AppColors.blueColor1,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back,
                        color: AppColors.iceWhiteColor),
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

          // Lista de documentos
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                // Documentos normais
                ...documentos.map(
                  (doc) => Column(
                    children: [
                      Material(
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(16),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: () {
                            // Aqui você pode abrir links ou detalhes do documento
                          },
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
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),

                // PDFs extras do Título de Eleitor
                if (titulo == 'Título de Eleitor') ...[
                  _buildDownloadBox(
                    context,
                    titulo: 'Passo a passo para emissão do Título de Eleitor',
                    assetPath: 'assets/titulo_tre.pdf',
                  ),
                  const SizedBox(height: 16),
                  _buildDownloadBox(
                    context,
                    titulo:
                        'Passo a passo para requerimentos diversos ao TRE/SC',
                    assetPath: 'assets/requerimento_tre.pdf',
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Caixa com botão de download
  Widget _buildDownloadBox(
    BuildContext context, {
    required String titulo,
    required String assetPath,
  }) {
    final nomeArquivo = assetPath.split('/').last;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              titulo,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                color: AppColors.blueColor1,
              ),
            ),
          ),
          IconButton(
            onPressed: () => _salvarPdf(context, assetPath, nomeArquivo),
            icon: const Icon(Icons.download, color: AppColors.blueColor1),
            iconSize: 28,
            tooltip: 'Baixar PDF',
          ),
        ],
      ),
    );
  }
}
