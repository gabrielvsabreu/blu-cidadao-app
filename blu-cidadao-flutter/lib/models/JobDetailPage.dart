import 'package:flutter/material.dart';

class JobDetailPage extends StatelessWidget {
  final Map<String, dynamic> job;

  const JobDetailPage({required this.job});

  @override
  Widget build(BuildContext context) {
    final title = job['title'] ?? 'Sem título';
    final company = job['company']?['display_name'] ?? 'Empresa não informada';
    final location = job['location']?['display_name'] ?? 'Local não informado';
    final description = job['description'] ?? 'Sem descrição';
    final salary = job['salary_min'] != null
        ? 'R\$${job['salary_min'].toString()}+'
        : 'Salário não informado';

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(company, style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text(location),
            SizedBox(height: 8),
            Text(salary),
            SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Text(description),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
