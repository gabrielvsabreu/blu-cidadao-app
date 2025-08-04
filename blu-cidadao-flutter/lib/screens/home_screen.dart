import 'package:flutter/material.dart';
import 'service_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Início', style: TextStyle(fontSize: 20)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Buscar serviço...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              'Serviços disponíveis',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: const [
                  ServiceTile(
                    title: 'Emergência',
                    subtitle: 'Contato com Polícia, Bombeiros ou SAMU via chat',
                    icon: Icons.warning_amber_rounded,
                    color: Colors.red,
                  ),
                  ServiceTile(
                    title: 'Veículos e Condutores',
                    subtitle: 'Habilitação, veículos e infrações',
                    icon: Icons.directions_car,
                    color: Colors.deepPurple,
                  ),
                  ServiceTile(
                    title: 'Documentos',
                    subtitle: 'Emitir documentos, agendar serviços e tirar dúvidas',
                    icon: Icons.description,
                    color: Colors.blueGrey,
                  ),
                  ServiceTile(
                    title: 'Agendamento de Serviço',
                    subtitle: 'Agende e acompanhe seus atendimentos',
                    icon: Icons.calendar_month,
                    color: Colors.indigo,
                  ),
                  ServiceTile(
                    title: 'Educação',
                    subtitle: 'Lista de escolas municipais e suas informações',
                    icon: Icons.school,
                    color: Colors.green,
                  ),
                  ServiceTile(
                    title: 'Saúde',
                    subtitle: 'Acesso a serviços e integração com o app Pronto',
                    icon: Icons.local_hospital,
                    color: Colors.pink,
                  ),
                  ServiceTile(
                    title: 'Água, Esgoto e Energia',
                    subtitle: 'Acesso a serviços da Samae e Celesc',
                    icon: Icons.water_drop,
                    color: Colors.teal,
                  ),
                  ServiceTile(
                    title: 'Trabalho e Emprego',
                    subtitle: 'Vagas disponíveis e outros serviços de emprego',
                    icon: Icons.work,
                    color: Colors.orange,
                  ),
                  ServiceTile(
                    title: 'Notícias',
                    subtitle: 'Acompanhe as últimas notícias da cidade',
                    icon: Icons.article,
                    color: Colors.cyan,
                  ),
                  ServiceTile(
                    title: 'Ouvidoria',
                    subtitle: 'Registrar, pesquisar e acompanhar manifestações',
                    icon: Icons.record_voice_over,
                    color: Colors.brown,
                  ),
                ],
              ),
            )
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

  const ServiceTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color.withOpacity(0.15),
        child: Icon(icon, color: color),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ServiceDetailScreen(
              title: title,
              description: subtitle,
              icon: icon,
              color: color,
            ),
          ),
        );
      },
    );
  }
}
