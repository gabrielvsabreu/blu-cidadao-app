class Escola {
  final String nome;
  final String municipio;
  final String endereco;
  final String telefone;

  Escola({
    required this.nome,
    required this.municipio,
    required this.endereco,
    required this.telefone,
  });

  factory Escola.fromJson(Map<String, dynamic> json) {
    return Escola(
      nome: json['NOME_ESCOLA'] ?? 'Sem nome',
      municipio: json['MUNICIPIO'] ?? '',
      endereco: json['ENDERECO'] ?? '',
      telefone: json['TELEFONE'] ?? '',
    );
  }
}
