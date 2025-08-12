import 'veiculos_model.dart';

class VeiculosServiceData {
  // Serviços de Habilitação
  static List<VeiculoService> getHabilitacao() {
    return [
      VeiculoService(nome: 'Alterar endereço do condutor', url: 'URL_AQUI'),
      VeiculoService(nome: 'CNH Digital', url: 'URL_AQUI'),
      VeiculoService(nome: 'Consulta Clínica do Exame Médico', url: 'URL_AQUI'),
      VeiculoService(nome: 'Consultar resultado de exame de legislação', url: 'URL_AQUI'),
      VeiculoService(nome: 'Pontuação do condutor', url: 'URL_AQUI'),
      VeiculoService(nome: 'Situação da emissão/entrega CNH', url: 'URL_AQUI'),
      VeiculoService(nome: 'Solicitar 2ª via da CNH', url: 'URL_AQUI'),
      VeiculoService(nome: 'Solicitar CNH definitiva', url: 'URL_AQUI'),
      VeiculoService(nome: 'Solicitar mudança de categoria CNH', url: 'URL_AQUI'),
      VeiculoService(nome: 'Solicitar renovação da CNH', url: 'URL_AQUI'),
      VeiculoService(nome: 'Solicitar segunda via de taxas de habilitação', url: 'URL_AQUI'),
      VeiculoService(nome: 'Solicitar adição de categoria CNH', url: 'URL_AQUI'),
      VeiculoService(nome: 'Acesse mais serviços da habilitação', url: 'URL_AQUI'),
    ];
  }

  // Serviços de Veículos
  static List<VeiculoService> getVeiculos() {
    return [
      VeiculoService(nome: 'Consulta IPVA e Taxa de Licenciamento (CPF)', url: 'URL_AQUI'),
      VeiculoService(nome: 'Consulta IPVA e Taxa de Licenciamento (Renavam)', url: 'URL_AQUI'),
      VeiculoService(nome: 'Fale com a AF - IPVA e TRLAV', url: 'URL_AQUI'),
      VeiculoService(nome: 'Agenda serviços de veículos', url: 'URL_AQUI'),
      VeiculoService(nome: 'Alvará de liberação de veículos removidos (irregularidade)', url: 'URL_AQUI'),
      VeiculoService(nome: 'CRLV Digital - PDF', url: 'URL_AQUI'),
      VeiculoService(nome: 'Motivo se não licenciamento', url: 'URL_AQUI'),
      VeiculoService(nome: 'Print dos dados do veículo', url: 'URL_AQUI'),
      VeiculoService(nome: 'Situação do veículo', url: 'URL_AQUI'),
      VeiculoService(nome: 'Solicitar comunicação da venda do veículo', url: 'URL_AQUI'),
      VeiculoService(nome: 'Transferir propriedade de veículo (comprador)', url: 'URL_AQUI'),
      VeiculoService(nome: 'Solicitar certidão negativa de propriedade', url: 'URL_AQUI'),
      VeiculoService(nome: 'Acesse mais serviços de veículos', url: 'URL_AQUI'),
    ];
  }

  // Serviços de Infrações
  static List<VeiculoService> getInfracoes() {
    return [
      VeiculoService(nome: 'Consultar resultado exame de reciclagem', url: 'URL_AQUI'),
      VeiculoService(nome: 'Consultar resultado de indicação do condutor infrator', url: 'URL_AQUI'),
      VeiculoService(nome: 'Defesas de autuação', url: 'URL_AQUI'),
      VeiculoService(nome: 'Emissão extrato de multas', url: 'URL_AQUI'),
      VeiculoService(nome: 'Indicação do real infrator', url: 'URL_AQUI'),
      VeiculoService(nome: 'Processo administrativo de trânsito', url: 'URL_AQUI'),
      VeiculoService(nome: 'Recursos do JARI', url: 'URL_AQUI'),
      VeiculoService(nome: 'Acesse mais serviços de infrações', url: 'URL_AQUI'),
    ];
  }
}
