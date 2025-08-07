import 'package:flutter/material.dart';

class SaudePage extends StatelessWidget {
  const SaudePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Saúde')),
      body: const Center(child: Text('Conteúdo da página de saúde')),
    );
  }
}
