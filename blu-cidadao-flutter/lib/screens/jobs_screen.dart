import 'package:blu_cidadao/models/JobDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/job_service.dart';

class JobsPage extends StatefulWidget {
  const JobsPage({super.key});

  @override
  State<JobsPage> createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  final JobService jobService = JobService();
  final TextEditingController _searchController = TextEditingController();
  String jobType = 'presencial'; // ou 'homeoffice'
  List<dynamic> jobs = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadJobs(); // Isso faz as vagas aparecerem assim que a tela abre
  }

  Future<void> loadJobs() async {
    setState(() => isLoading = true);
    try {
      final query = _searchController.text.trim();
      final location = jobType == 'homeoffice' ? 'Brasil' : 'Blumenau';
      final data = await jobService.fetchJobs(query: query, location: location);

      // Filtrar manualmente por 'remoto' se for homeoffice
      final filteredJobs = jobType == 'homeoffice'
          ? data.where((job) {
              final desc = job['description']?.toString().toLowerCase() ?? '';
              final title = job['title']?.toString().toLowerCase() ?? '';
              return desc.contains('home office') ||
                  desc.contains('remoto') ||
                  title.contains('remoto');
            }).toList()
          : data;

      setState(() {
        jobs = filteredJobs;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      print('Erro ao buscar empregos: $e');
    }
  }

  Future<void> _launchURL(String? url) async {
    if (url != null && await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Não foi possível abrir o anúncio')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trabalho e Emprego'),
        backgroundColor: colorScheme.surface,
        elevation: 0.5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              style: GoogleFonts.poppins(),
              decoration: InputDecoration(
                labelText: 'Buscar função',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onSubmitted: (_) => loadJobs(),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                ChoiceChip(
                  label: const Text('Presencial (Blumenau)'),
                  selected: jobType == 'presencial',
                  onSelected: (_) {
                    setState(() => jobType = 'presencial');
                    loadJobs();
                  },
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('Home Office (Brasil)'),
                  selected: jobType == 'homeoffice',
                  onSelected: (_) {
                    setState(() => jobType = 'homeoffice');
                    loadJobs();
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : jobs.isEmpty
                  ? const Center(child: Text('Nenhuma vaga encontrada'))
                  : ListView.builder(
                      itemCount: jobs.length,
                      itemBuilder: (context, index) {
                        final job = jobs[index];
                        final title = job['title'] ?? 'Sem título';
                        final company =
                            job['company']?['display_name'] ??
                            'Empresa não informada';
                        final location =
                            job['location']?['display_name'] ??
                            'Local não informado';
                        final salary = job['salary_min'] != null
                            ? 'R\$${job['salary_min'].toString()}+'
                            : 'Salário não informado';
                        final url = job['redirect_url'];

                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => JobDetailPage(job: job),
                                ),
                              );
                            },

                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    title,
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: colorScheme.onSurface,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    company,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: colorScheme.onSurface.withOpacity(
                                        0.8,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    location,
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      color: colorScheme.onSurface.withOpacity(
                                        0.6,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    salary,
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
