import 'package:blu_cidadao/models/EscolaDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/escola_service.dart';

class EscolasPage extends StatefulWidget {
  const EscolasPage({super.key});

  @override
  State<EscolasPage> createState() => _EscolasPageState();
}

class _EscolasPageState extends State<EscolasPage> {
  final EscolaService schoolService = EscolaService();
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> allSchools = []; // Lista completa de escolas
  List<dynamic> schools = []; // Lista filtrada de escolas para exibição
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadSchools();
    // Adiciona um listener para o campo de busca
    _searchController.addListener(() {
      filterSchools(_searchController.text);
    });
  }

  // Função para filtrar a lista de escolas com base no texto de busca
  void filterSchools(String query) {
    setState(() {
      if (query.isEmpty) {
        schools = allSchools;
      } else {
        schools = allSchools.where((school) {
          final name = school['NOME_DA_ESCOLA']?.toString().toLowerCase() ?? '';
          final district =
              school['BAIRRO_LOCALIDADE']?.toString().toLowerCase() ?? '';
          final city = school['CIDADE']?.toString().toLowerCase() ?? '';
          return name.contains(query.toLowerCase()) ||
              district.contains(query.toLowerCase()) ||
              city.contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  Future<void> loadSchools() async {
    setState(() => isLoading = true);
    try {
      final data = await schoolService.fetchSchools();
      setState(() {
        allSchools = data;
        schools = data; // Inicialmente, a lista de exibição é a lista completa
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      print('Erro ao carregar escolas: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Educação'),
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
                labelText: 'Buscar escola, bairro ou cidade',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : schools.isEmpty
                  ? const Center(child: Text('Nenhuma escola encontrada'))
                  : ListView.builder(
                      itemCount: schools.length,
                      itemBuilder: (context, index) {
                        final school = schools[index];
                        final name =
                            school['NOME_DA_ESCOLA'] ?? 'Nome não informado';
                        final address =
                            school['ENDERECO_CEP'] ?? 'Endereço não informado';
                        final district =
                            school['BAIRRO_LOCALIDADE'] ??
                            'Bairro não informado';

                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {
                              // Navega para a tela de detalhes
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      EscolaDetailPage(escola: school),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    name,
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: colorScheme.onSurface,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    'Bairro: $district',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: colorScheme.onSurface.withOpacity(
                                        0.8,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    address,
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      color: colorScheme.onSurface.withOpacity(
                                        0.6,
                                      ),
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
