import 'package:flutter/material.dart';
import 'package:blu_cidadao/common/constants/app_colors.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class ContaPage extends StatefulWidget {
  const ContaPage({super.key});

  @override
  State<ContaPage> createState() => _ContaPageState();
}

class _ContaPageState extends State<ContaPage> {
  final Map<String, String> dadosUsuario = {
    "Nome": "Gabriel Abreu",
    "CPF": "123.456.789-01",
    "E-mail": "gabriel@email.com",
    "Telefone": "47 999999999",
    "Data de Nascimento": "01/10/1996",
    "Senha": "*********",
  };

  Future<void> _abrirAlertaAlteracao() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.iceWhiteColor,
        title: const Text(
          "Alteração de Dados",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Inter",
            fontSize: 18,
            color: AppColors.blueColor1,
          ),
        ),
        content: const Text(
          "Esses dados foram recuperados da sua conta gov.\n\n"
          "Para alterá-los, você será direcionado para o acesso gov.br.",
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "Cancelar",
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 14,
                color: AppColors.blueColor1,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context); // fecha modal
              final url =
                  "https://sso.acesso.gov.br/login?client_id=portal-logado.estaleiro.serpro.gov.br&authorization_id=198c7cda21f";
              if (await canLaunchUrl(Uri.parse(url))) {
                await launchUrl(
                  Uri.parse(url),
                  mode: LaunchMode.externalApplication,
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.blueColor1,
            ),
            child: const Text(
              "Continuar",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "Inter",
                fontSize: 14,
                color: AppColors.iceWhiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        initialValue: value,
        readOnly: true,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            fontFamily: "Inter",
            fontSize: 14,
            color: AppColors.blueColor1,
          ),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // transparente sempre
        statusBarIconBrightness: Brightness.light, // Android: ícones brancos
        statusBarBrightness: Brightness.dark, // iOS: texto branco
      ),
      child: Scaffold(
        backgroundColor: AppColors.iceWhiteColor,
        body: Column(
          children: [
            // Cabeçalho
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
                    const Text(
                      'Conta',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: AppColors.iceWhiteColor,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Conteúdo
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ListView(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Perfil",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Inter",
                                fontSize: 18,
                                color: AppColors.blueColor1,
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(
                                  Icons.verified_user,
                                  color: AppColors.blueColor1,
                                ),
                                SizedBox(width: 6),
                                Text(
                                  "Perfil Verificado",
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 14,
                                    color: AppColors.blueColor1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        const CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(
                            "assets/images/avatar.png",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Dados do usuário (não editáveis)
                    ...dadosUsuario.entries.map(
                      (e) => _buildInfoItem(e.key, e.value),
                    ),

                    const SizedBox(height: 32),

                    // Botão alterar dados
                    ElevatedButton(
                      onPressed: _abrirAlertaAlteracao,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blueColor1,
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: const Text(
                        "Alterar dados",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Inter",
                          fontSize: 14,
                          color: AppColors.iceWhiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
