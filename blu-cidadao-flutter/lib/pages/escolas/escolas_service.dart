import 'dart:convert';
import 'package:blu_cidadao/pages/escolas/escolas.dart';
import 'package:http/http.dart' as http;

class EscolaService {
  Future<List<Escola>> fetchEscolas({
    String? municipio,
    String? rede,
    String? etapa,
  }) async {
    final uri = Uri.parse(
      'https://api-escolas-production.up.railway.app/escolas' +
          '?municipio=${municipio ?? ''}&rede=${rede ?? ''}&etapa=${etapa ?? ''}',
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
        'municipios': List<String>.from(data['municipios']),
        'redes': List<String>.from(data['redes']),
        'etapas': List<String>.from(data['etapas']),
      };
    } else {
      throw Exception('Erro ao buscar opções');
    }
  }
}
