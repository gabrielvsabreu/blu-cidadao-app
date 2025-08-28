import 'package:blu_cidadao/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class JobApplicationPage extends StatelessWidget {
  const JobApplicationPage({super.key});

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
                      'Candidatar',
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
              child: Center(
                child: Text(
                  'Página em construção',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: AppColors.blueColor1,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
