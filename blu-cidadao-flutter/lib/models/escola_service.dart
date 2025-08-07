import 'dart:convert';
import 'package:http/http.dart' as http;

// O nome da classe deve ser alterado para refletir a nova função
class EscolaService {
  Future<List<dynamic>> fetchSchools() async {
    // A URL completa da API para a lista de escolas
    final url = Uri.parse(
      'https://dados.sc.gov.br/api/3/action/datastore_search?resource_id=fed30613-e5ea-44f6-80e6-db1d121242d3&limit=1000',
    );

    final response = await http.get(url);
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      
      // O caminho para os dados mudou. No padrão desse tipo de API,
      // a lista de resultados geralmente está em ['result']['records'].
      // Caso não funcione, você precisará inspecionar a resposta da API para
      // encontrar o caminho correto.
      return data['result']['records'];
      
    } else {
      // Mensagem de erro mais genérica
      throw Exception('Falha ao carregar a lista de escolas');
    }
  }
}