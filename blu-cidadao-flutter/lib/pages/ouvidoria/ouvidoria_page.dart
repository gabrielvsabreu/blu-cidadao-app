import 'package:flutter/material.dart';
import 'package:blu_cidadao/common/constants/app_colors.dart';

class OuvidoriaPage extends StatefulWidget {
  const OuvidoriaPage({super.key});

  @override
  State<OuvidoriaPage> createState() => _OuvidoriaPageState();
}

class _OuvidoriaPageState extends State<OuvidoriaPage> {
  final _formKey = GlobalKey<FormState>();
  String? _tipoSelecionado;
  final _descricaoController = TextEditingController();

  final List<String> tipos = [
    'Reclamação',
    'Sugestão',
    'Solicitação',
    'Elogio',
    'Informação',
  ];

  void _enviarSolicitacao() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Solicitação registrada com sucesso!',
            style: TextStyle(fontFamily: 'Inter'),
          ),
          backgroundColor: Colors.green,
        ),
      );
      _formKey.currentState!.reset();
      setState(() => _tipoSelecionado = null);
      _descricaoController.clear();
    }
  }

  @override
  void dispose() {
    _descricaoController.dispose();
    super.dispose();
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
                  const Text(
                    'Ouvidoria Cidadã',
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    const Text(
                      'Tipo de solicitação:',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.blueColor1),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.blueColor1),
                        ),
                      ),
                      value: _tipoSelecionado,
                      items: tipos.map((tipo) {
                        return DropdownMenuItem<String>(
                          value: tipo,
                          child: Text(
                            tipo,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) =>
                          setState(() => _tipoSelecionado = value),
                      validator: (value) => value == null
                          ? 'Selecione um tipo de solicitação'
                          : null,
                      style: const TextStyle(fontFamily: 'Inter', fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Descreva a situação:',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextFormField(
                      controller: _descricaoController,
                      maxLines: 6,
                      cursorColor: AppColors.blueColor1,
                      style: const TextStyle(fontFamily: 'Inter', fontSize: 16),
                      decoration: const InputDecoration(
                        hintText:
                            'Descreva aqui sua solicitação de forma clara...',
                        hintStyle: TextStyle(fontFamily: 'Inter', fontSize: 16),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.blueColor1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.blueColor1),
                        ),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obrigatório';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: _enviarSolicitacao,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: AppColors.blueColor1,
                      ),
                      child: const Text(
                        'Enviar Solicitação',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          color: AppColors.iceWhiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
