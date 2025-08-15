import 'veiculos_model.dart';

class VeiculosServiceData {
  // Serviços de Habilitação
  static List<VeiculoService> getHabilitacao() {
    return [
      VeiculoService(nome: 'Resultado de Provas', url: 'https://www.detran.sc.gov.br/resultado-de-provas/'),
      VeiculoService(nome: 'Permissão para Dirigir (Primeira CNH)', url: 'https://www.detran.sc.gov.br/permissao-para-dirigir/'),
      VeiculoService(nome: 'CNH Definitiva', url: 'https://www.detran.sc.gov.br/cnh-definitiva/'),
      VeiculoService(nome: 'Renovação da CNH', url: 'https://www.detran.sc.gov.br/renovacao-cnh/'),
      VeiculoService(nome: 'Segunda via da CNH', url: 'https://www.detran.sc.gov.br/segunda-via-cnh/'),
      VeiculoService(nome: 'CNH Digital', url: 'https://www.detran.sc.gov.br/cnh-digital-cnh/'),
      VeiculoService(nome: 'Mudança de Categoria', url: 'https://www.detran.sc.gov.br/mudanca-de-categoria-cnh/'),
      VeiculoService(nome: 'Adição de Categoria', url: 'https://www.detran.sc.gov.br/adicao-de-categoria-cnh/'),
      VeiculoService(nome: 'Suspensão de CNH', url: 'https://www.detran.sc.gov.br/suspensao-cnh/'),
      VeiculoService(nome: 'Curso de Reciclagem', url: 'https://www.detran.sc.gov.br/curso-de-reciclagem-cnh/'),
    ];
  }

  // Serviços de Veículos
  static List<VeiculoService> getVeiculos() {
    return [
      VeiculoService(nome: 'Licenciamento Anual', url: 'https://www.detran.sc.gov.br/licenciamento-anual-veiculos/'),
      VeiculoService(nome: 'Certidão', url: 'https://www.detran.sc.gov.br/certidao-veiculos/'),
      VeiculoService(nome: 'Transferências de Veículos', url: 'https://www.detran.sc.gov.br/transferencia-de-veiculos/'),
      VeiculoService(nome: 'Registro de Comunicação de Venda', url: 'https://www.detran.sc.gov.br/comunicacao-de-venda-veiculos/'),
      VeiculoService(nome: 'Inclusão ou Baixa de Gravame Financeiro', url: 'https://www.detran.sc.gov.br/inclusao-ou-baixa-de-gravame-financeiro/'),
      VeiculoService(nome: 'Registrar Intenção de Venda do Veículo', url: 'https://www.detran.sc.gov.br/registrar-intencao-de-venda-do-veiculo/'),
      VeiculoService(nome: 'Licenciamento em Meio Digital', url: 'https://www.detran.sc.gov.br/licenciamento-em-meio-digital-veiculos/'),
      VeiculoService(nome: 'RECALL', url: 'https://www.detran.sc.gov.br/recall/'),
      VeiculoService(nome: 'Remarcação de Chassi', url: 'https://www.detran.sc.gov.br/remarcacao-de-chassi-veiculos/'),
      VeiculoService(nome: 'Registro Inicial', url: 'https://www.detran.sc.gov.br/registro-inicial-veiculos/'),
    ];
  }
}
