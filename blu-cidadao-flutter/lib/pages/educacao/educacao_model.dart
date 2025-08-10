class EducacaoModel {
  final String nome;
  final String municipio;
  final String tipo;
  final String? nota;

  EducacaoModel({
    required this.nome,
    required this.municipio,
    required this.tipo,
    this.nota,
  });

  factory EducacaoModel.fromJson(Map<String, dynamic> json) {
    return EducacaoModel(
      nome: json['nome'] ?? 'Sem nome',
      municipio: json['municipio'] ?? 'Desconhecido',
      tipo: (json['rede'] ?? 'municipal').toLowerCase(),
      nota: json['ideb']?.toString() ?? 'Nota não informada',
    );
  }
}
