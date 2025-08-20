import 'package:file_saver/file_saver.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';

Future<void> documentosPdf(String assetPath, String nomeArquivo) async {
  try {
    final byteData = await rootBundle.load(assetPath);
    final Uint8List bytes = byteData.buffer.asUint8List();

    await FileSaver.instance.saveFile(
      name: nomeArquivo.replaceAll('.pdf', ''),
      bytes: bytes,
      ext: 'pdf',
      mimeType: MimeType.pdf,
    );
  } catch (e) {
    print('Erro ao salvar PDF: $e');
  }
}
