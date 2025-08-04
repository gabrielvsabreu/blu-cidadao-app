import 'package:flutter/material.dart';

class ServiceDetailScreen extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  const ServiceDetailScreen({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    // Conteúdo específico para cada serviço
    Widget content;

    switch (title) {
      case 'Emergência':
        content = _buildEmergencyContent();
        break;
      case 'Veículos e Condutores':
        content = _buildVehiclesContent();
        break;
      case 'Documentos':
        content = _buildDocumentsContent();
        break;
      case 'Agendamento de Serviço':
        content = _buildAppointmentsContent();
        break;
      case 'Educação':
        content = _buildEducationContent();
        break;
      case 'Saúde':
        content = _buildHealthContent();
        break;
      case 'Água, Esgoto e Energia':
        content = _buildUtilitiesContent();
        break;
      case 'Trabalho e Emprego':
        content = _buildJobsContent();
        break;
      case 'Notícias':
        content = _buildNewsContent();
        break;
      case 'Ouvidoria':
        content = _buildOmbudsmanContent();
        break;
      default:
        content = const Text("Conteúdo não disponível.");
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: content,
      ),
    );
  }

  Widget _buildEmergencyContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Emergência', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 12),
        Text('Fale com a Polícia, Bombeiros ou SAMU.'),
        SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: null, // aqui futuramente terá a função de chat
          icon: Icon(Icons.chat),
          label: Text('Iniciar Chat de Emergência'),
        ),
      ],
    );
  }

  Widget _buildVehiclesContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Veículos e Condutores', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 12),
        Text('• Consultar habilitação\n• Visualizar veículos cadastrados\n• Checar infrações registradas'),
      ],
    );
  }

  Widget _buildDocumentsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Documentos', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 12),
        Text('• Emissão de documentos\n• Agendar serviços\n• Dúvidas frequentes'),
      ],
    );
  }

  Widget _buildAppointmentsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Agendamentos', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 12),
        Text('Visualize e gerencie seus atendimentos agendados.'),
      ],
    );
  }

  Widget _buildEducationContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Educação', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 12),
        Text('Veja a lista de escolas municipais e suas informações:\n\n• Nome da escola\n• Endereço\n• Contato\n• Modalidades de ensino'),
      ],
    );
  }

  Widget _buildHealthContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Saúde', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 12),
        Text('• Acesse o app Pronto (integração futura com BluCidadão)\n• Marque consultas\n• Visualize exames'),
      ],
    );
  }

  Widget _buildUtilitiesContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Água, Esgoto e Energia', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 12),
        Text('• Integração com Samae\n• Integração com Celesc\n• Solicitações e 2ª via de conta'),
      ],
    );
  }

  Widget _buildJobsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Trabalho e Emprego', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 12),
        Text('• Vagas disponíveis\n• Encaminhamento para entrevistas\n• Currículo digital'),
      ],
    );
  }

  Widget _buildNewsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Notícias', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 12),
        Text('Fique por dentro das novidades da cidade.\n(Em breve: integração com feed de notícias oficial)'),
      ],
    );
  }

  Widget _buildOmbudsmanContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Ouvidoria', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 12),
        Text('• Registrar manifestação\n• Pesquisar manifestações\n• Acompanhar respostas'),
      ],
    );
  }
}
