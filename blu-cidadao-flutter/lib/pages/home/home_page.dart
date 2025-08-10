import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../emprego/jobs_page.dart';
import '../emergencia/emergencia_page.dart';
import '../transporte/veiculos_page.dart';
import '../documentos/documentos_page.dart';
import '../agendamento/agendamento_page.dart';
import '../escolas/escolas_page.dart';
import '../saude/saude_page.dart';
import '../agua_esgoto/infraestrutura_page.dart';
import '../noticias/noticias_page.dart';
import '../ouvidoria/ouvidoria_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: Text(
          'Início',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: colorScheme.onBackground,
          ),
        ),
        backgroundColor: colorScheme.surface,
        elevation: 0.5,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              style: GoogleFonts.poppins(color: colorScheme.onSurface),
              decoration: InputDecoration(
                hintText: 'Buscar serviço...',
                hintStyle: GoogleFonts.poppins(color: theme.hintColor),
                prefixIcon: Icon(Icons.search, color: theme.iconTheme.color),
                filled: true,
                fillColor: colorScheme.surface,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Serviços disponíveis',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: colorScheme.onBackground,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Scrollbar(
                thumbVisibility: true,
                thickness: 6,
                radius: const Radius.circular(12),
                trackVisibility: false,
                interactive: true,
                child: ListView(
                  children: [
                    const SizedBox(height: 6),
                    ServiceTile(
                      title: 'Emergência',
                      subtitle:
                          'Contato com Polícia, Bombeiros ou SAMU via chat',
                      icon: Icons.warning_amber_rounded,
                      color: Colors.red,
                      route: const EmergenciaPage(),
                    ),
                    ServiceTile(
                      title: 'Veículos e Condutores',
                      subtitle: 'Habilitação, veículos e infrações',
                      icon: Icons.directions_car,
                      color: Colors.deepPurple,
                      route: const VeiculosPage(),
                    ),
                    ServiceTile(
                      title: 'Documentos',
                      subtitle:
                          'Emitir documentos, agendar serviços e tirar dúvidas',
                      icon: Icons.description,
                      color: Colors.blueGrey,
                      route: const DocumentosPage(),
                    ),
                    ServiceTile(
                      title: 'Agendamento de Serviço',
                      subtitle: 'Agende e acompanhe seus atendimentos',
                      icon: Icons.calendar_month,
                      color: Colors.indigo,
                      route: const AgendamentoPage(),
                    ),
                    ServiceTile(
                      title: 'Educação',
                      subtitle:
                          'Lista de escolas municipais e suas informações',
                      icon: Icons.school,
                      color: Colors.green,
                      route: EscolasPage(),
                    ),
                    ServiceTile(
                      title: 'Saúde',
                      subtitle:
                          'Acesso a serviços e integração com o app Pronto',
                      icon: Icons.local_hospital,
                      color: Colors.pink,
                      route: const SaudePage(),
                    ),
                    ServiceTile(
                      title: 'Água, Esgoto e Energia',
                      subtitle: 'Acesso a serviços da Samae e Celesc',
                      icon: Icons.water_drop,
                      color: Colors.teal,
                      route: const InfraestruturaPage(),
                    ),
                    ServiceTile(
                      title: 'Trabalho e Emprego',
                      subtitle:
                          'Vagas disponíveis e outros serviços de emprego',
                      icon: Icons.work,
                      color: Colors.orange,
                      route: const JobsPage(),
                    ),
                    ServiceTile(
                      title: 'Notícias',
                      subtitle: 'Acompanhe as últimas notícias da cidade',
                      icon: Icons.article,
                      color: Colors.cyan,
                      route: const NoticiasPage(),
                    ),
                    ServiceTile(
                      title: 'Ouvidoria',
                      subtitle:
                          'Registrar, pesquisar e acompanhar manifestações',
                      icon: Icons.record_voice_over,
                      color: Colors.brown,
                      route: const OuvidoriaPage(),
                    ),
                    const SizedBox(height: 12),
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

class ServiceTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Widget route;

  const ServiceTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.dividerColor.withOpacity(0.08)),
      ),
      child: ListTile(
        leading: Icon(icon, color: color.withOpacity(0.85), size: 28),
        title: Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface,
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => route));
        },
      ),
    );
  }
}
