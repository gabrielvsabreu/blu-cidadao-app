import 'package:blu_cidadao/pages/infraestrutura/infra_model.dart';

class InfraServiceData {
  static List<InfraService> getServicos() {
    return [
      InfraService(
        nome: 'SAMAE',
        url: 'https://www.samae.com.br/area-do-cliente',
        subtitulo: 'Serviços de água e esgoto',
      ),
      InfraService(
        nome: 'CELESC',
        url: 'https://www.celesc.com.br/servicos',
        subtitulo: 'Energia elétrica e atendimento online',
      ),
    ];
  }
}
