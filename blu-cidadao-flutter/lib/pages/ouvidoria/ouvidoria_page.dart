import 'package:flutter/material.dart';

const Color blueColor1 = Color(0xFF006df0);
const Color iceWhiteColor = Color(0xFFF5F9FF);

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
          content: Text('Solicitação registrada com sucesso!'),
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
      appBar: AppBar(title: const Text('Ouvidoria Cidadã')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                'Tipo de solicitação:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: blueColor1),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: blueColor1),
                  ),
                ),
                value: _tipoSelecionado,
                items: tipos.map((tipo) {
                  return DropdownMenuItem<String>(
                    value: tipo,
                    child: Text(tipo),
                  );
                }).toList(),
                onChanged: (value) => setState(() => _tipoSelecionado = value),
                validator: (value) =>
                    value == null ? 'Selecione um tipo de solicitação' : null,
              ),
              const SizedBox(height: 20),
              const Text(
                'Descreva a situação:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _descricaoController,
                maxLines: 6,
                cursorColor: blueColor1,
                decoration: const InputDecoration(
                  hintText: 'Descreva aqui sua solicitação de forma clara...',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: blueColor1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: blueColor1),
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
                  backgroundColor: blueColor1,
                ),
                child: const Text(
                  'Enviar Solicitação',
                  style: TextStyle(fontSize: 16, color: iceWhiteColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
