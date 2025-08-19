class Escola {
  final String nome;
  final String dependencia;
  final String categoria;
  final String localizacao;
  final String endereco;
  final String cep;
  final String telefone;

  final bool areaVerde;
  final bool auditorio;
  final bool banheiroPNE;
  final bool biblioteca;
  final bool labInfo;
  final bool patioCoberto;
  final bool parqueInfantil;
  final bool quadraEsporte;
  final bool refeitorio;
  final bool recursosAccessibilidade;
  final bool internetAlunos;
  final bool alimentacao;

  final bool edInfantil;
  final bool edFundamental;
  final bool edMedio;
  final bool edProfissional;
  final bool edEJA;
  final bool edEspecial;

  Escola({
    required this.nome,
    required this.dependencia,
    required this.categoria,
    required this.localizacao,
    required this.endereco,
    required this.cep,
    required this.telefone,
    required this.areaVerde,
    required this.auditorio,
    required this.banheiroPNE,
    required this.biblioteca,
    required this.labInfo,
    required this.patioCoberto,
    required this.parqueInfantil,
    required this.quadraEsporte,
    required this.refeitorio,
    required this.recursosAccessibilidade,
    required this.internetAlunos,
    required this.alimentacao,
    required this.edInfantil,
    required this.edFundamental,
    required this.edMedio,
    required this.edProfissional,
    required this.edEJA,
    required this.edEspecial,
  });

  factory Escola.fromJson(Map<String, dynamic> json) {
    bool parseBool(dynamic value) {
      if (value is bool) return value;
      if (value is String) return value.toLowerCase() == 'true';
      return false;
    }

    return Escola(
      nome: json['ESCOLA'],
      dependencia: json['DEPENDENCIA'],
      categoria: json['CATEGORIA'],
      localizacao: json['LOCALIZACAO'],
      endereco: json['ENDERECO'],
      cep: json['CEP'],
      telefone: json['TELEFONE'],
      areaVerde: parseBool(json['AREA_VERDE']),
      auditorio: parseBool(json['AUDITORIO']),
      banheiroPNE: parseBool(json['BANHEIRO_PNE']),
      biblioteca: parseBool(json['BIBLIOTECA']),
      labInfo: parseBool(json['LABORATORIO_INFORMATICA']),
      patioCoberto: parseBool(json['PATIO_COBERTO']),
      parqueInfantil: parseBool(json['PARQUE_INFANTIL']),
      quadraEsporte: parseBool(json['QUADRA_ESPORTES']),
      refeitorio: parseBool(json['REFEITORIO']),
      recursosAccessibilidade: parseBool(json['RECURSOS_ACESSIBILIDADE']),
      internetAlunos: parseBool(json['INTERNET_ALUNOS']),
      alimentacao: parseBool(json['ALIMENTACAO']),
      edInfantil: parseBool(json['ED_INF']),
      edFundamental: parseBool(json['ED_FUND']),
      edMedio: parseBool(json['ED_MED']),
      edProfissional: parseBool(json['ED_PROF']),
      edEJA: parseBool(json['ED_EJA']),
      edEspecial: parseBool(json['ED_ESP']),
    );
  }
}
