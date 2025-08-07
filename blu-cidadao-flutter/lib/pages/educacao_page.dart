import 'package:flutter/material.dart';

class EducacaoPage extends StatelessWidget {
  const EducacaoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Educação')),
      body: const Center(child: Text('Conteúdo da página de educação')),
    );
  }
}
