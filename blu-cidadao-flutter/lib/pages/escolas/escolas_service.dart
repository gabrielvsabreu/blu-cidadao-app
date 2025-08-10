import 'dart:convert';
import 'package:blu_cidadao/pages/escolas/escolas.dart';
import 'package:http/http.dart' as http;

class EscolaService {
  Future<List<Escola>> fetchEscolas() async {
    final uri = Uri.parse('http://10.0.2.2:8080/escolas');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => Escola.fromJson(e)).toList();
    } else {
      throw Exception('Erro ao carregar escolas: ${response.statusCode}');
    }
  }
}
