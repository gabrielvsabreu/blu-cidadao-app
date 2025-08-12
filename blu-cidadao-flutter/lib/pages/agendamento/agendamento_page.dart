import 'package:flutter/material.dart';
import 'package:blu_cidadao/common/constants/app_colors.dart';

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
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.blueColor1,
              onPrimary: AppColors.whiteColor,
              onSurface: AppColors.blueColor1,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.blueColor1,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() => _dataSelecionada = picked);
    }
  }

  Future<void> _selecionarHorario() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.blueColor1,
              onPrimary: AppColors.whiteColor,
              onSurface: AppColors.blueColor1,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.blueColor1,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() => _horarioSelecionado = picked);
    }
  }

  void _enviarFormulario() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Agendamento realizado com sucesso!',
            style: TextStyle(fontFamily: 'Inter'),
          ),
          backgroundColor: Colors.green,
        ),
      );
    }
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
                    'Agendar Atendimento',
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
                      'Selecione o setor desejado:',
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
                      value: _setorSelecionado,
                      items: setores.map((setor) {
                        return DropdownMenuItem<String>(
                          value: setor,
                          child: Text(
                            setor,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) =>
                          setState(() => _setorSelecionado = value),
                      validator: (value) =>
                          value == null ? 'Selecione um setor' : null,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: _selecionarData,
                      icon: const Icon(
                        Icons.date_range,
                        color: AppColors.blueColor1,
                      ),
                      label: Text(
                        _dataSelecionada == null
                            ? 'Selecionar data'
                            : 'Data: ${_dataSelecionada!.day}/${_dataSelecionada!.month}/${_dataSelecionada!.year}',
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          color: AppColors.blueColor1,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: AppColors.blueColor1),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: _selecionarHorario,
                      icon: const Icon(
                        Icons.access_time,
                        color: AppColors.blueColor1,
                      ),
                      label: Text(
                        _horarioSelecionado == null
                            ? 'Selecionar horário'
                            : 'Horário: ${_horarioSelecionado!.format(context)}',
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          color: AppColors.blueColor1,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.whiteColor,
                        side: const BorderSide(color: AppColors.blueColor1),
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: _enviarFormulario,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: AppColors.blueColor1,
                      ),
                      child: const Text(
                        'Confirmar Agendamento',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          color: AppColors.iceWhiteColor,
                          fontWeight: FontWeight.bold,
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
