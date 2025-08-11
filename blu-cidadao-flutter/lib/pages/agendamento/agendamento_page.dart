import 'package:flutter/material.dart';

class AgendamentoPage extends StatefulWidget {
  const AgendamentoPage({super.key});

  @override
  State<AgendamentoPage> createState() => _AgendamentoPageState();
}

class _AgendamentoPageState extends State<AgendamentoPage> {
  final _formKey = GlobalKey<FormState>();
  String? _setorSelecionado;
  DateTime? _dataSelecionada;
  TimeOfDay? _horarioSelecionado;

  final List<String> setores = [
    'Protocolo Geral',
    'Cadastro Único',
    'Tributação / IPTU',
    'Alvarás e Licenças',
    'Ouvidoria Cidadã',
    'Saúde / SUS Municipal',
  ];

  Future<void> _selecionarData() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    if (picked != null) {
      setState(() => _dataSelecionada = picked);
    }
  }

  Future<void> _selecionarHorario() async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null) {
      setState(() => _horarioSelecionado = picked);
    }
  }

  void _enviarFormulario() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Agendamento realizado com sucesso!'),
        backgroundColor: Colors.green,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendar Atendimento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                'Selecione o setor desejado:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              DropdownButtonFormField<String>(
                value: _setorSelecionado,
                items: setores.map((setor) {
                  return DropdownMenuItem<String>(
                    value: setor,
                    child: Text(setor),
                  );
                }).toList(),
                onChanged: (value) => setState(() => _setorSelecionado = value),
                validator: (value) =>
                    value == null ? 'Selecione um setor' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _selecionarData,
                icon: const Icon(Icons.date_range),
                label: Text(_dataSelecionada == null
                    ? 'Selecionar data'
                    : 'Data: ${_dataSelecionada!.day}/${_dataSelecionada!.month}/${_dataSelecionada!.year}'),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: _selecionarHorario,
                icon: const Icon(Icons.access_time),
                label: Text(_horarioSelecionado == null
                    ? 'Selecionar horário'
                    : 'Horário: ${_horarioSelecionado!.format(context)}'),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _enviarFormulario,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  'Confirmar Agendamento',
                  style: TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
