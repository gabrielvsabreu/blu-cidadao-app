import 'dart:convert';
import 'package:http/http.dart' as http;
import 'educacao_model.dart';

class EducacaoService {
  Future<List<EducacaoModel>> buscarEscolas() async {
    final url = Uri.parse(
      'http://api.dadosabertosinep.org/v1/ideb/escolas.json?codigo_municipio=4202404',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      // A API do INEP retorna os dados na chave 'data'
      if (jsonData.containsKey('data') && jsonData['data'] is List) {
        final records = jsonData['data'] as List;

        // LOG para ver o conteúdo dos dados
        print('Total de escolas retornadas pela API: ${records.length}');

        return records.map((e) => EducacaoModel.fromJson(e)).toList();
      } else {
        throw Exception('Formato inesperado de resposta da API');
      }
    } else {
      throw Exception('Erro ao carregar escolas: ${response.statusCode}');
    }
  }
}
