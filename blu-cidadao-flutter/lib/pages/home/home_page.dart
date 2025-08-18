import 'package:blu_cidadao/pages/educacao/educacao_page.dart';
import 'package:blu_cidadao/pages/menu/notifications_page.dart';
import 'package:blu_cidadao/pages/menu/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/constants/app_colors.dart';
import '../agendamento/agendamento_page.dart';
import '../documentos/documentos_page.dart';
import '../emergencia/emergencia_page.dart';
import '../emprego/jobs_page.dart';
import '../infraestrutura/infra_page.dart';
import '../noticias/noticias_page.dart';
import '../ouvidoria/ouvidoria_page.dart';
import '../saude/saude_page.dart';
import '../veiculo/veiculos_home_page.dart';

class HomePage extends StatelessWidget {
  final String nomeUsuario = 'Gabriel';

  const HomePage({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.iceWhiteColor,
      drawer: Drawer(
        child: Column(
          children: [
            // 🔵 TOPO: Caixa azul escuro com avatar, nome e ID
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
                      color: AppColors.iceWhiteColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'ID: 2984000063',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: AppColors.iceWhiteColor,
                    ),
                  ),
                ],
              ),
            ),

            // ⚪ MEIO: Itens do menu com fundo icewhite
            Expanded(
              child: Container(
                color: AppColors.iceWhiteColor,
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    vertical: 24,
                    horizontal: 20,
                  ),
                  children: [
                    menuItem(Icons.dashboard, 'Início', () {
                      Navigator.pop(context);
                    }),
                    const SizedBox(height: 32),
                    menuItem(Icons.account_circle, 'Perfil', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ProfilePage()),
                      );
                    }),
                    const SizedBox(height: 32),
                    menuItem(Icons.notifications, 'Notificações', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const NotificationsPage(),
                        ),
                      );
                    }),
                    const SizedBox(height: 32),
                    menuItem(Icons.info_outline, 'Sobre', () {
                      // abrir página futura
                    }),
                    const SizedBox(height: 32),
                    menuItem(Icons.support_agent, 'Suporte', () {
                      // abrir suporte futuro
                    }),
                    const SizedBox(height: 32),
                    menuItem(Icons.logout, 'Logout', () {
                      // ação de logout
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top bar: logo + menu
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/logo2.png', height: 30),
                  Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bem-vindo(a), $nomeUsuario!',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Como podemos te ajudar hoje?',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.blueColor1,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Buscar serviço',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.iceWhiteColor,
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      style: GoogleFonts.inter(color: AppColors.iceWhiteColor),
                      decoration: InputDecoration(
                        hintText: 'Digite o serviço que deseja...',
                        hintStyle: GoogleFonts.inter(color: Colors.white70),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: AppColors.iceWhiteColor,
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.15),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Serviços disponíveis',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blueColor1,
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.2,
                  children: [
                    serviceBox(
                      context,
                      'Emergência',
                      Icons.warning_amber_rounded,
                      Colors.red,
                      const EmergenciaPage(),
                    ),
                    serviceBox(
                      context,
                      'DETRAN-SC',
                      Icons.directions_car,
                      Colors.deepPurple,
                      const VeiculosHomePage(),
                    ),
                    serviceBox(
                      context,
                      'Documentos',
                      Icons.description,
                      Colors.blueGrey,
                      const DocumentosPage(),
                    ),
                    serviceBox(
                      context,
                      'Agendamentos',
                      Icons.calendar_month,
                      Colors.indigo,
                      const AgendamentoPage(),
                    ),
                    serviceBox(
                      context,
                      'Educação',
                      Icons.school,
                      Colors.green,
                      const EducacaoPage(),
                    ),
                    serviceBox(
                      context,
                      'Saúde',
                      Icons.local_hospital,
                      Colors.pink,
                      const SaudePage(),
                    ),
                    serviceBox(
                      context,
                      'Infraestrutura',
                      Icons.water_drop,
                      Colors.teal,
                      const InfraestruturaPage(),
                    ),
                    serviceBox(
                      context,
                      'Emprego',
                      Icons.work,
                      Colors.orange,
                      const JobsPage(),
                    ),
                    serviceBox(
                      context,
                      'Notícias',
                      Icons.article,
                      Colors.cyan,
                      const NoticiasPage(),
                    ),
                    serviceBox(
                      context,
                      'Ouvidoria',
                      Icons.record_voice_over,
                      Colors.brown,
                      const OuvidoriaPage(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget serviceBox(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    Widget route,
  ) {
    return GestureDetector(
      onTap: () =>
          Navigator.push(context, MaterialPageRoute(builder: (_) => route)),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFEFF1F3),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(
              title,
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
}
