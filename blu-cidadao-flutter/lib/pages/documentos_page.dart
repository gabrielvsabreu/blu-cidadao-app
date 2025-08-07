import 'package:flutter/material.dart';

class DocumentosPage extends StatelessWidget {
  const DocumentosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Documentos')),
      body: const Center(child: Text('Conteúdo da página de documentos')),
    );
  }
}
