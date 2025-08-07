import 'package:flutter/material.dart';

class EscolaDetailPage extends StatelessWidget {
  final Map<String, dynamic> escola;

  const EscolaDetailPage({super.key, required this.escola});

  @override
  Widget build(BuildContext context) {
    // Mapeando as chaves da API para as variáveis
    final name = escola['NOME_DA_ESCOLA'] ?? 'Nome não informado';
    final address = escola['ENDERECO_CEP'] ?? 'Endereço não informado';
    final phone = escola['TELEFONE'] ?? 'Telefone não informado';
    final email = escola['EMAIL'] ?? 'Email não informado';
    final district = escola['BAIRRO_LOCALIDADE'] ?? 'Bairro não informado';

    // A API possui um campo 'IDEB_NOTA', mas pode ser nulo ou não existir
    final idebScore = escola['IDEB_NOTA'] != null
        ? 'IDEB: ${escola['IDEB_NOTA'].toString()}'
        : 'IDEB não informado';

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0.5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Endereço: $address',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              'Bairro: $district',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              'Telefone: $phone',
              style: const TextStyle(fontSize: 16, color: Colors.blue),
            ),
            const SizedBox(height: 4),
            Text(
              'E-mail: $email',
              style: const TextStyle(fontSize: 16, color: Colors.blue),
            ),
            const SizedBox(height: 16),
            Text(
              idebScore,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 16),
            // Você pode adicionar mais informações ou um mapa aqui, se desejar
          ],
        ),
      ),
    );
  }
}