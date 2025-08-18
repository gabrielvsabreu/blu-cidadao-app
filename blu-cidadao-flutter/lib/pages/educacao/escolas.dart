class Escola {
  final String nome;
  final String municipio;
  final String categoria;

  Escola({
    required this.nome,
    required this.municipio,
    required this.categoria,
  });

  factory Escola.fromJson(Map<String, dynamic> json) {
    return Escola(
      nome: json['NO_ENTIDADE'] ?? '',
      municipio: json['NO_MUNICIPIO'] ?? '',
      categoria: json['TP_DEPENDENCIA'] ?? '',
    );
  }
}
