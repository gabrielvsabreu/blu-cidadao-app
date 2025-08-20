import 'package:blu_cidadao/common/constants/app_colors.dart';
import 'package:blu_cidadao/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.iceWhiteColor,
      body: Column(
        children: [
          // Stack para imagem + sobreposição da caixa branca
          Stack(
            children: [
              SizedBox(
                height: size.height * 0.55,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/mulher-celular.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: -20, // sobrepõe a caixa branca na imagem
                left: 0,
                right: 0,
                child: Container(
                  height: 40,
                  decoration: const BoxDecoration(
                    color: AppColors.iceWhiteColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 12,
                        offset: Offset(0, -4),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Conteúdo principal
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              decoration: const BoxDecoration(color: AppColors.iceWhiteColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo2.png',
                    width: 250,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 40),
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.black45,
                      ),
                      children: [
                        TextSpan(
                          text: 'Ao entrar, você concorda com nosso\n',
                          style: TextStyle(color: AppColors.blueColor1),
                        ),
                        TextSpan(
                          text: 'termo de responsabilidade',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                          ),
                        ),
                        TextSpan(
                          text: ' e ',
                          style: TextStyle(color: AppColors.blueColor1),
                        ),
                        TextSpan(
                          text: 'política de privacidade',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                          ),
                        ),
                        TextSpan(text: '.'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blueColor1,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 4,
                        shadowColor: Colors.black26,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const HomePage()),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            color: AppColors.iceWhiteColor,
                          ),
                          children: [
                            TextSpan(text: 'Entrar com '),
                            TextSpan(
                              text: 'gov.br',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
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
