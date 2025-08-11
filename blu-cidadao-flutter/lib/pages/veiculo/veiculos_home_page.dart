import 'package:flutter/material.dart';
import 'veiculos_lista_page.dart';
import 'veiculos_service.dart';

const Color blueColor1 = Color(0xFF006df0);
const Color iceWhiteColor = Color(0xFFF5F9FF);

class VeiculosHomePage extends StatelessWidget {
  const VeiculosHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Veículos e Condutores')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.person),
              label: const Text('Habilitação'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(60),
                backgroundColor: iceWhiteColor,
                foregroundColor: blueColor1,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => VeiculosListaPage(
                      titulo: 'Habilitação',
                      servicos: VeiculosServiceData.getHabilitacao(),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.directions_car),
              label: const Text('Veículos'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(60),
                backgroundColor: iceWhiteColor,
                foregroundColor: blueColor1,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => VeiculosListaPage(
                      titulo: 'Veículos',
                      servicos: VeiculosServiceData.getVeiculos(),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.report),
              label: const Text('Infrações'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(60),
                backgroundColor: iceWhiteColor,
                foregroundColor: blueColor1,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => VeiculosListaPage(
                      titulo: 'Infrações',
                      servicos: VeiculosServiceData.getInfracoes(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
