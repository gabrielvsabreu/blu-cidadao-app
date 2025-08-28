import 'package:blu_cidadao/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SobrePage extends StatelessWidget {
  const SobrePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // transparente sempre
        statusBarIconBrightness: Brightness.light, // Android: ícones brancos
        statusBarBrightness: Brightness.dark, // iOS: texto branco
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
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
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Sobre o BluCidadão',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Aproximando a prefeitura do cidadão.',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'O BluCidadão é um aplicativo inovador, idealizado para ser o canal oficial de serviços online da Prefeitura de Blumenau. Nossa missão é facilitar e centralizar a vida do cidadão, permitindo que você acesse os serviços municipais de forma rápida e intuitiva, diretamente do seu celular.',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Nossa História',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Acreditamos que a tecnologia é uma ferramenta poderosa para conectar pessoas e governos. O projeto nasceu da vontade de aproximar os cidadãos dos serviços públicos, tornando a comunicação com a prefeitura mais eficiente e acessível a todos.',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Desenvolvimento',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Este aplicativo foi desenvolvido como projeto final da turma de Java do Entra21 (Senac Blumenau), pela equipe ONECODE. É um exemplo de como a programação pode ser usada para resolver desafios reais e beneficiar a comunidade.',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Próximos Passos',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Esta é apenas a primeira versão do BluCidadão. Futuramente, planejamos expandir as funcionalidades e integrar mais serviços, sempre com o objetivo de tornar a sua experiência com a prefeitura cada vez melhor.',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 24),
                    const Divider(),
                    const SizedBox(height: 16),
                    const Text(
                      'Para mais informações, entre em contato:',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'contato@blucidadao.com.br',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'www.blucidadao.com.br',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
