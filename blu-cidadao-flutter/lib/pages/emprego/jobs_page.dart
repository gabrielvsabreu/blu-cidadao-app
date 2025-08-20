import 'package:blu_cidadao/common/constants/app_colors.dart';
import 'package:blu_cidadao/pages/emprego/job_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'job_service.dart';

class JobsPage extends StatefulWidget {
  const JobsPage({super.key});

  @override
  State<JobsPage> createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  final JobService jobService = JobService();
  final TextEditingController _searchController = TextEditingController();
  String jobType = 'all'; // all, presencial, homeoffice
  List<dynamic> jobs = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadJobs(); // Carrega vagas ao abrir
  }

  Future<void> loadJobs() async {
    setState(() => isLoading = true);
    try {
      final query = _searchController.text.trim();

      List<dynamic> allJobs = [];

      if (jobType == 'all') {
        // Presencial em SC
        final scJobs = await jobService.fetchJobs(
          query: query,
          location: "Santa Catarina",
        );
        final presencial = scJobs.where((job) {
          final desc = job['description']?.toString().toLowerCase() ?? '';
          final title = job['title']?.toString().toLowerCase() ?? '';
          return !desc.contains('home office') &&
              !desc.contains('remoto') &&
              !title.contains('remoto');
        }).toList();

        // Home office no Brasil
        final brJobs = await jobService.fetchJobs(
          query: query,
          location: "Brasil",
        );
        final homeoffice = brJobs.where((job) {
          final desc = job['description']?.toString().toLowerCase() ?? '';
          final title = job['title']?.toString().toLowerCase() ?? '';
          return desc.contains('home office') ||
              desc.contains('remoto') ||
              title.contains('remoto');
        }).toList();

        allJobs = [...presencial, ...homeoffice];
      } else if (jobType == 'presencial') {
        final scJobs = await jobService.fetchJobs(
          query: query,
          location: "Santa Catarina",
        );
        allJobs = scJobs.where((job) {
          final desc = job['description']?.toString().toLowerCase() ?? '';
          final title = job['title']?.toString().toLowerCase() ?? '';
          return !desc.contains('home office') &&
              !desc.contains('remoto') &&
              !title.contains('remoto');
        }).toList();
      } else if (jobType == 'homeoffice') {
        final brJobs = await jobService.fetchJobs(
          query: query,
          location: "Brasil",
        );
        allJobs = brJobs.where((job) {
          final desc = job['description']?.toString().toLowerCase() ?? '';
          final title = job['title']?.toString().toLowerCase() ?? '';
          return desc.contains('home office') ||
              desc.contains('remoto') ||
              title.contains('remoto');
        }).toList();
      }

      setState(() {
        jobs = allJobs;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      print('Erro ao buscar empregos: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.iceWhiteColor,
      body: Column(
        children: [
          // Cabeçalho azul
          Container(
            height: 120,
            color: AppColors.blueColor1,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.iceWhiteColor,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Vagas de Emprego',
                    style: GoogleFonts.inter(
                      color: AppColors.iceWhiteColor,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Corpo
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Busca
                  TextField(
                    controller: _searchController,
                    style: GoogleFonts.inter(),
                    decoration: InputDecoration(
                      labelText: 'Buscar função',
                      labelStyle: GoogleFonts.inter(),
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onSubmitted: (_) => loadJobs(),
                  ),
                  const SizedBox(height: 12),

                  // Chips
                  Row(
                    children: [
                      ChoiceChip(
                        label: Text(
                          'Todos',
                          style: GoogleFonts.inter(
                            color: jobType == 'all'
                                ? Colors.white
                                : AppColors.blueColor1,
                          ),
                        ),
                        selected: jobType == 'all',
                        selectedColor: AppColors.blueColor1,
                        backgroundColor: Colors.grey[300],
                        onSelected: (_) {
                          setState(() => jobType = 'all');
                          loadJobs();
                        },
                      ),
                      const SizedBox(width: 8),
                      ChoiceChip(
                        label: Text(
                          'Presencial',
                          style: GoogleFonts.inter(
                            color: jobType == 'presencial'
                                ? Colors.white
                                : AppColors.blueColor1,
                          ),
                        ),
                        selected: jobType == 'presencial',
                        selectedColor: AppColors.blueColor1,
                        backgroundColor: Colors.grey[300],
                        onSelected: (_) {
                          setState(() => jobType = 'presencial');
                          loadJobs();
                        },
                      ),
                      const SizedBox(width: 8),
                      ChoiceChip(
                        label: Text(
                          'Home Office',
                          style: GoogleFonts.inter(
                            color: jobType == 'homeoffice'
                                ? Colors.white
                                : AppColors.blueColor1,
                          ),
                        ),
                        selected: jobType == 'homeoffice',
                        selectedColor: AppColors.blueColor1,
                        backgroundColor: Colors.grey[300],
                        onSelected: (_) {
                          setState(() => jobType = 'homeoffice');
                          loadJobs();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Lista de vagas
                  Expanded(
                    child: isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : jobs.isEmpty
                        ? Center(
                            child: Text(
                              'Nenhuma vaga encontrada',
                              style: GoogleFonts.inter(),
                            ),
                          )
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

                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => JobDetailPage(job: job),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: AppColors.borderColor.withOpacity(
                                      0.3,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        title,
                                        style: GoogleFonts.inter(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.blueColor1,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        company,
                                        style: GoogleFonts.inter(
                                          fontSize: 14,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        location,
                                        style: GoogleFonts.inter(
                                          fontSize: 13,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        salary,
                                        style: GoogleFonts.inter(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.blueColor1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
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
