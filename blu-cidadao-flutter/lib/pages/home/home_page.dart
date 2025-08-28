import 'package:blu_cidadao/pages/educacao/educacao_page.dart';
import 'package:blu_cidadao/pages/menu/notificacoes_page.dart';
import 'package:blu_cidadao/pages/menu/conta_page.dart';
import 'package:blu_cidadao/pages/menu/sobre_page.dart';
import 'package:blu_cidadao/pages/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/constants/app_colors.dart';
import '../documentos/documentos_home_page.dart';
import '../emergencia/emergencia_page.dart';
import '../emprego/jobs_page.dart';
import '../infraestrutura/infra_page.dart';
import '../ouvidoria/ouvidoria_page.dart';
import '../saude/saude_page.dart';
import '../detran/detran_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class ServiceItem {
  final String title;
  final dynamic icon;
  final Widget page;
  final List<String> subServices;

  ServiceItem({
    required this.title,
    required this.icon,
    required this.page,
    this.subServices = const [],
  });
}

class _HomePageState extends State<HomePage> {
  final String nomeUsuario = 'Gabriel';
  String query = "";

  late List<ServiceItem> allServices;
  List<ServiceItem> filteredServices = [];

  @override
  void initState() {
    super.initState();

    allServices = [
      ServiceItem(
        title: 'Ouvidoria',
        icon: Image.asset('assets/icons/ouvidoria.png', width: 32, height: 32),
        page: const OuvidoriaPage(),
        subServices: [
          'Registrar manifestação',
          'Pesquisar manifestações',
          'Acompanhar solicitações',
        ],
      ),
      ServiceItem(
        title: 'Educação',
        icon: Image.asset('assets/icons/education.png', height: 32),
        page: const EducacaoPage(),
        subServices: ['Escolas municipais', 'Calendário escolar'],
      ),
      ServiceItem(
        title: 'Vagas de Emprego',
        icon: Image.asset('assets/icons/job.png', width: 32, height: 32),
        page: const JobsPage(),
        subServices: ['Vagas de emprego', 'Programas de estágio'],
      ),
      ServiceItem(
        title: 'DETRAN-SC',
        icon: Image.asset(
          'assets/icons/logo-detran.png',
          width: 30,
          height: 30,
          color: AppColors.blueColor1,
        ),
        page: const VeiculosHomePage(),
        subServices: ['Habilitação', 'Veículos', 'Infrações'],
      ),
      ServiceItem(
        title: 'Documentos',
        icon: Image.asset('assets/icons/document.png', height: 30),
        page: const DocumentosHomePage(),
        subServices: ['Emitir documentos', 'Agendar emissão', 'Tirar dúvidas'],
      ),
      ServiceItem(
        title: 'Saúde',
        icon: Image.asset('assets/icons/saude.png', height: 32),
        page: const SaudePage(),
        subServices: ['Pronto atendimento', 'Consultas médicas'],
      ),
      ServiceItem(
        title: 'Água, Esgoto e Energia',
        icon: Image.asset(
          'assets/icons/samae-celesc-logo.png',
          height: 32,
          color: AppColors.blueColor1,
        ),
        page: const InfraestruturaPage(),
        subServices: ['Água e Esgoto', 'Energia elétrica'],
      ),
      ServiceItem(
        title: 'Emergência',
        icon: Image.asset(
          'assets/icons/emergencia.png',
          height: 32,
          color: AppColors.blueColor1,
        ),
        page: const EmergenciaPage(),
        subServices: ['Polícia', 'Bombeiros', 'SAMU'],
      ),
    ];

    filteredServices = List.from(allServices);
  }

  void updateSearch(String input) {
    setState(() {
      query = input.toLowerCase();
      if (query.isEmpty) {
        filteredServices = List.from(allServices);
      } else {
        filteredServices = allServices.where((service) {
          final inTitle = service.title.toLowerCase().contains(query);
          final inSub = service.subServices.any(
            (s) => s.toLowerCase().contains(query),
          );
          return inTitle || inSub;
        }).toList();
      }
    });
  }

  Widget menuItem(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: AppColors.blueColor1, size: 24),
          const SizedBox(width: 16),
          Text(
            label,
            style: GoogleFonts.inter(fontSize: 16, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget serviceBox(ServiceItem service) {
    Widget iconWidget;
    if (service.icon is IconData) {
      iconWidget = Icon(service.icon, size: 32);
    } else if (service.icon is Widget) {
      iconWidget = service.icon;
    } else {
      iconWidget = const SizedBox();
    }

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => service.page),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconWidget,
            const SizedBox(height: 8),
            Text(
              service.title,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                color: AppColors.blueColor1,
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      nomeUsuario,
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'ID: 2984000063',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                      vertical: 24,
                      horizontal: 20,
                    ),
                    children: [
                      menuItem(Icons.account_circle, 'Conta', () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const ContaPage()),
                        );
                      }),
                      const SizedBox(height: 32),
                      menuItem(Icons.info_outline, 'Sobre o BluCidadão', () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const SobrePage()),
                        );
                      }),
                      const SizedBox(height: 32),
                      menuItem(Icons.logout, 'Logout', () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const OnboardingPage(),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // 🔹 Cabeçalho fixo + lista rolável
        body: Column(
          children: [
            // Cabeçalho azul fixo
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 50, 16, 30),
              decoration: const BoxDecoration(
                color: AppColors.blueColor1,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/logo2.png',
                        height: 32,
                        color: Colors.white,
                      ),
                      Builder(
                        builder: (context) => IconButton(
                          icon: const Icon(Icons.menu, color: Colors.white),
                          onPressed: () => Scaffold.of(context).openDrawer(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/avatar.png'),
                      ),
                      const SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bem-vindo(a), $nomeUsuario!',
                            style: GoogleFonts.inter(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Como podemos te ajudar hoje?',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Builder(
                        builder: (context) => IconButton(
                          icon: const Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NotificacoesPage(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  // 🔹 Campo de busca dentro da caixa azul
                  TextField(
                    onChanged: updateSearch,
                    style: GoogleFonts.inter(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Digite o serviço que deseja...',
                      hintStyle: GoogleFonts.inter(color: Colors.white70),
                      prefixIcon: const Icon(Icons.search, color: Colors.white),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.15),
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Lista rolável de serviços
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      childAspectRatio: 1.2,
                      children: filteredServices
                          .map((s) => serviceBox(s))
                          .toList(),
                    ),
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
