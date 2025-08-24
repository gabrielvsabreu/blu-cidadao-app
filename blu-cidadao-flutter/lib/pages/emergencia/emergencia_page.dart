import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'emergencia_service.dart';
import 'package:blu_cidadao/common/constants/app_colors.dart';

class EmergenciaPage extends StatefulWidget {
  const EmergenciaPage({super.key});

  @override
  State<EmergenciaPage> createState() => _EmergenciaPageState();
}

class _EmergenciaPageState extends State<EmergenciaPage> {
  final EmergenciaService _service = EmergenciaService();
  final TextEditingController _controller = TextEditingController();

  void _enviarMensagem() {
    if (_controller.text.trim().isEmpty) return;

    setState(() {
      _service.enviarMensagemUsuario(_controller.text.trim());
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final mensagens = _service.getMensagens();

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
            // Barra superior customizada
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
                      'Emergência',
                      style: TextStyle(
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

            // Barra de aviso abaixo da barra principal
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              color: AppColors.lightGrey,
              child: const Text(
                "⚠️ Use o chatbot abaixo para pedir ajuda...",
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Lista de mensagens
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: mensagens.length,
                itemBuilder: (context, index) {
                  final msg = mensagens[index];
                  return Align(
                    alignment: msg.ehUsuario
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        color: msg.ehUsuario
                            ? AppColors.lightGrey
                            : AppColors.blueColor1,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        msg.texto,
                        style: TextStyle(
                          color: msg.ehUsuario
                              ? AppColors.textColor
                              : AppColors.iceWhiteColor,
                          fontFamily: 'Inter',
                          fontSize: 14,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Barra de digitação
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: "Digite sua mensagem...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: AppColors.blueColor1),
                    onPressed: _enviarMensagem,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
