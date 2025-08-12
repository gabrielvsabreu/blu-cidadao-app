import 'package:blu_cidadao/pages/saude/saude_model.dart';

class SaudeServiceData {
  static List<SaudeService> getServicos() {
    return [
      SaudeService(
        nome: 'PRONTO DIGITAL',
        url: 'https://pronto.blumenau.sc.gov.br/pronto/loginsistema.aspx',
        subtitulo: 'Consulta de prontuários, exames e agendamentos',
      ),
      SaudeService(
        nome: 'MEU SUS DIGITAL',
        url: 'https://meususdigital.saude.gov.br/login',
        subtitulo: 'Histórico clínico, vacinas e resultados de exames',
      ),
    ];
  }
}
