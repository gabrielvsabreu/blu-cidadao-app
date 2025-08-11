import 'package:blu_cidadao/pages/saude/saude_model.dart';

class SaudeServiceData {
  static List<SaudeService> getServicos() {
    return [
      SaudeService(
        nome: 'PRONTO DIGITAL',
        url: 'https://pronto.blumenau.sc.gov.br/pronto/loginsistema.aspx',
      ),
      SaudeService(
        nome: 'MEU SUS DIGITAL',
        url: 'https://meususdigital.saude.gov.br/login',
      ),
    ];
  }
}
