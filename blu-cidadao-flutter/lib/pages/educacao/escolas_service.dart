import 'dart:convert';
import 'package:blu_cidadao/pages/educacao/escolas.dart';
import 'package:http/http.dart' as http;

class EscolaService {
  Future<List<Escola>> fetchEscolas({
    String? dependencia,
    String? categoria,
  }) async {
    final uri = Uri.parse(
      'https://api-escolas-production.up.railway.app/escolas' '?dependencia=${dependencia ?? ''}&categoria=${categoria ?? ''}',
    );
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data.map<Escola>((e) => Escola.fromJson(e)).toList();
    } else {
      throw Exception('Erro ao buscar escolas');
    }
  }

  Future<Map<String, List<String>>> fetchOpcoes() async {
    final uri = Uri.parse(
      'https://api-escolas-production.up.railway.app/opcoes',
    );
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return {
        'dependencias': List<String>.from(data['dependencias'] ?? []),
        'categorias': List<String>.from(data['categorias'] ?? []),
      };
    } else {
      throw Exception('Erro ao buscar opções');
    }
  }
}
