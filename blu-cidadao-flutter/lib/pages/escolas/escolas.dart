class Escola {
  final String nome;
  final String municipio;
  final String tipo;

  Escola({required this.nome, required this.municipio, required this.tipo});

  factory Escola.fromJson(Map<String, dynamic> json) {
    return Escola(
      nome: json['NO_ENTIDADE'] ?? '',
      municipio: json['NO_MUNICIPIO'] ?? '',
      tipo: json['TP_DEPENDENCIA'] ?? '',
    );
  }
}
