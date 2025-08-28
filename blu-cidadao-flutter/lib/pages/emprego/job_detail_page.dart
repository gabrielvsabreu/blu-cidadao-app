import 'package:blu_cidadao/common/constants/app_colors.dart';
import 'package:blu_cidadao/pages/emprego/job_application_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class JobDetailPage extends StatelessWidget {
  final Map<String, dynamic> job;

  const JobDetailPage({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    final title = job['title'] ?? 'Sem título';
    final company = job['company']?['display_name'] ?? 'Empresa não informada';
    final location = job['location']?['display_name'] ?? 'Local não informado';
    final description = job['description'] ?? 'Sem descrição';
    final salary = job['salary_min'] != null
        ? 'R\$${job['salary_min'].toString()}+'
        : 'Salário não informado';

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
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
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "Detalhes da vaga",
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

            // Conteúdo
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoCard('Cargo', title, Icons.work),
                    const SizedBox(height: 12),
                    _buildInfoCard('Empresa', company, Icons.business),
                    const SizedBox(height: 12),
                    _buildInfoCard('Localização', location, Icons.location_on),
                    const SizedBox(height: 12),
                    _buildInfoCard('Salário', salary, Icons.attach_money),
                    const SizedBox(height: 20),

                    const Text(
                      'Descrição da vaga',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blueColor1,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        // Botão de candidatar-se fixo no rodapé
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blueColor1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // Aqui você pode navegar para a página de candidatura
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const JobApplicationPage(),
                    ),
                  );
                },
                child: const Text(
                  "Candidatar-se",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.blueColor1, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blueColor1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
