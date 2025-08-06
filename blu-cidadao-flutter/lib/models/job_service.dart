import 'dart:convert';
import 'package:http/http.dart' as http;

class JobService {
  final String appId = '132fb7c6';
  final String appKey = 'd85f33450ae5e3bdd3d1fb7599774e05';

  Future<List<dynamic>> fetchJobs({
    String query = '',
    String location = '',
  }) async {
    final baseUrl = 'https://api.adzuna.com/v1/api/jobs/br/search/1';
    final url = Uri.parse(
      '$baseUrl?app_id=$appId&app_key=$appKey&results_per_page=20&what=$query&where=$location',
    );

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['results'];
    } else {
      throw Exception('Falha ao carregar vagas');
    }
  }
}
