import 'documentos_model.dart';

class DocumentosServiceData {
  static List<DocumentoModel> getCPF() => [
    DocumentoModel(
      nome: 'Cadastramento \n on-line',

      url:
          'https://servicos.receita.fazenda.gov.br/servicos/cpf/inscricaopublica/inscricao.asp',
    ),
    DocumentoModel(
      nome: 'Regularização de cadastro',
      url:
          'https://servicos.receita.fazenda.gov.br/servicos/cpf/regularizar/default.asp',
    ),
    DocumentoModel(
      nome: 'Consulta de situação cadastral',
      url:
          'https://servicos.receita.fazenda.gov.br/servicos/cpf/consultasituacao/consultapublica.asp',
    ),
  ];

  static List<DocumentoModel> getTitulo() => [
    DocumentoModel(
      nome: 'Consulta e emissão',
      url: 'https://www.tre-sc.jus.br/',
    ),
  ];
}
