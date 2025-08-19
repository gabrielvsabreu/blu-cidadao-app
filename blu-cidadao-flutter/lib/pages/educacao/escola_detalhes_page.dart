import 'package:flutter/material.dart';
import 'package:blu_cidadao/common/constants/app_colors.dart';
import 'package:blu_cidadao/pages/educacao/escolas.dart';

class EscolaDetalhesPage extends StatelessWidget {
  final Escola escola;

  const EscolaDetalhesPage({super.key, required this.escola});

  Widget buildInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontFamily: "Inter",
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Widget buildBool(String label, bool value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            value ? Icons.check_circle : Icons.cancel,
            color: value ? Colors.green[900] : Colors.red[900],
          ),
          const SizedBox(width: 8),
          Text(label),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.iceWhiteColor,
      body: Column(
        children: [
          Container(
            height: 120,
            color: AppColors.blueColor1,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.iceWhiteColor,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    escola.nome,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      color: AppColors.iceWhiteColor,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                buildInfo('Dependência', escola.dependencia),
                buildInfo('Categoria', escola.categoria),
                buildInfo('Localização', escola.localizacao),
                buildInfo('Endereço', escola.endereco),
                buildInfo('CEP', escola.cep),
                buildInfo('Telefone', escola.telefone),
                const Divider(),
                const Text(
                  'Infraestrutura',
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                buildBool('Área Verde', escola.areaVerde),
                buildBool('Auditório', escola.auditorio),
                buildBool('Banheiro Acessível', escola.banheiroPNE),
                buildBool('Biblioteca', escola.biblioteca),
                buildBool('Laboratório de Informática', escola.labInfo),
                buildBool('Pátio Coberto', escola.patioCoberto),
                buildBool('Parque Infantil', escola.parqueInfantil),
                buildBool('Quadra de Esportes', escola.quadraEsporte),
                buildBool('Refeitório', escola.refeitorio),
                buildBool(
                  'Recursos de Acessibilidade',
                  escola.recursosAccessibilidade,
                ),
                buildBool('Internet para Alunos', escola.internetAlunos),
                buildBool('Alimentação Escolar', escola.alimentacao),
                const Divider(),
                const Text(
                  'Modalidades de Ensino',
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                buildBool('Educação Infantil', escola.edInfantil),
                buildBool('Ensino Fundamental', escola.edFundamental),
                buildBool('Ensino Médio', escola.edMedio),
                buildBool('Educação Profissional', escola.edProfissional),
                buildBool('Educação de Jovens e Adultos (EJA)', escola.edEJA),
                buildBool('Educação Especial', escola.edEspecial),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
