import 'package:blu_cidadao/pages/infraestrutura/infra_model.dart';

class InfraServiceData {
  static List<InfraService> getServicos() {
    return [
      InfraService(
        nome: 'SAMAE',
        url: 'https://www.samae.com.br/area-do-cliente',
      ),
      InfraService(
        nome: 'CELESC',
        url: 'https://www.celesc.com.br/servicos',
      ),
    ];
  }
}
