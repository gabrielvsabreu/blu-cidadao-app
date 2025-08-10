

import 'package:blu_cidadao/pages/infraestrutura/infra_model.dart';

class InfraServiceData {
  static List<InfraService> getServicos() {
    return [
      InfraService(
        nome: 'Água (SAMAE)',
        url: 'https://www.samae.com.br/area-do-cliente',
      ),
      InfraService(
        nome: 'Esgoto (SAMAE)',
        url: 'https://www.samae.com.br/area-do-cliente',
      ),
      InfraService(
        nome: 'Energia (CELESC)',
        url: 'https://servicos.celesc.com.br/portalcliente/web/login',
      ),
    ];
  }
}
