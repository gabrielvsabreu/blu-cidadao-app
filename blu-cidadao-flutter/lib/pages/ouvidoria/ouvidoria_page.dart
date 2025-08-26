import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:blu_cidadao/common/constants/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class OuvidoriaPage extends StatefulWidget {
  const OuvidoriaPage({super.key});

  @override
  State<OuvidoriaPage> createState() => _OuvidoriaPageState();
}

class _OuvidoriaPageState extends State<OuvidoriaPage> {
  final _formKey = GlobalKey<FormState>();
  final _descricaoController = TextEditingController();
  final _localController = TextEditingController();
  final _emailController = TextEditingController(text: 'gabriel@email.com');

  String? _tipoSelecionado;
  String? _areaSelecionada;
  File? _midiaSelecionada;
  List<dynamic> _historico = [];

  final List<String> tipos = [
    'RECLAMACAO',
    'SUGESTAO',
    'ELOGIO',
    'DENUNCIA',
    'SOLICITACAO_DE_INFORMACAO',
  ];

  final List<String> areas = [
    'SAUDE',
    'EDUCACAO',
    'INFRAESTRUTURA',
    'SEGURANCA',
    'ASSISTENCIA_SOCIAL',
    'MEIO_AMBIENTE',
    'TRANSITO_E_TRANSPORTE',
    'OUTROS',
  ];

  String formatarTipo(String tipo) {
    final mapa = {
      'RECLAMACAO': 'Reclamação',
      'SUGESTAO': 'Sugestão',
      'ELOGIO': 'Elogio',
      'DENUNCIA': 'Denúncia',
      'SOLICITACAO_DE_INFORMACAO': 'Solicitação de Informação',
    };
    return mapa[tipo] ??
        tipo
            .replaceAll('_', ' ')
            .toLowerCase()
            .split(' ')
            .map((word) => word[0].toUpperCase() + word.substring(1))
            .join(' ');
  }

  String formatarArea(String area) {
    final mapa = {
      'SAUDE': 'Saúde',
      'EDUCACAO': 'Educação',
      'INFRAESTRUTURA': 'Infraestrutura',
      'SEGURANCA': 'Segurança',
      'ASSISTENCIA_SOCIAL': 'Assistência Social',
      'MEIO_AMBIENTE': 'Meio Ambiente',
      'TRANSITO_E_TRANSPORTE': 'Trânsito e Transporte',
      'OUTROS': 'Outros',
    };
    return mapa[area] ??
        area
            .replaceAll('_', ' ')
            .toLowerCase()
            .split(' ')
            .map((word) => word[0].toUpperCase() + word.substring(1))
            .join(' ');
  }

  @override
  void initState() {
    super.initState();
    carregarHistorico();
  }

  Future<void> carregarHistorico() async {
    final response = await Dio().get(
      'https://api-ouvidoria-blucidadao-production.up.railway.app/api/manifestacoes/email/${_emailController.text}',
    );
    if (response.statusCode == 200) {
      setState(() {
        _historico = response.data;
      });
    }
  }

  Future<void> enviarManifestacao() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      FormData formData = FormData.fromMap({
        'tipo': _tipoSelecionado,
        'area': _areaSelecionada,
        'descricao': _descricaoController.text,
        'local': _localController.text,
        'email': _emailController.text,
        if (_midiaSelecionada != null)
          'arquivo': await MultipartFile.fromFile(_midiaSelecionada!.path),
      });

      final response = await Dio().post(
        'https://api-ouvidoria-blucidadao-production.up.railway.app/api/manifestacoes/upload',
        data: formData,
      );

      print('Resposta: ${response.statusCode} - ${response.data}');

      if (response.statusCode == 200) {
        // Limpa formulário
        _formKey.currentState!.reset();
        _descricaoController.clear();
        _localController.clear();
        _midiaSelecionada = null;
        _tipoSelecionado = null;
        _areaSelecionada = null;

        // Exibe aviso visual de sucesso
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Manifestação enviada com sucesso!')),
        );

        // Recarrega histórico para mostrar nova manifestação
        await carregarHistorico();
      }
    } catch (e) {
      print('Erro ao enviar manifestação: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Erro ao enviar: $e')));
    }
  }

  Future<void> excluirManifestacao(int id) async {
    final confirmacao = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.whiteColor,
        title: const Text("Confirmar Exclusão"),
        content: const Text("Deseja realmente excluir esta manifestação?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text(
              "Cancelar",
              style: TextStyle(color: AppColors.blueColor1),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red[900]),
            child: const Text(
              "Excluir",
              style: TextStyle(color: AppColors.whiteColor),
            ),
          ),
        ],
      ),
    );

    if (confirmacao != true) return;

    try {
      await Dio().delete(
        'https://api-ouvidoria-blucidadao-production.up.railway.app/api/manifestacoes/$id',
      );

      // Atualiza o estado da página principal
      setState(() {
        _historico.removeWhere((m) => m['id'] == id);
      });

      // Mostra o SnackBar depois do setState
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Manifestação excluída com sucesso!")),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Erro ao excluir: $e")));
    }
  }

  Future<void> atualizarManifestacao(dynamic manifestacao) async {
    final descricaoController = TextEditingController(
      text: manifestacao['descricao'],
    );
    final localController = TextEditingController(text: manifestacao['local']);
    String? tipoSelecionado = manifestacao['tipo'];
    String? areaSelecionada = manifestacao['area'];
    File? novaMidia;

    await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return AlertDialog(
              backgroundColor: AppColors.iceWhiteColor,
              title: const Text(
                "Editar Manifestação",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Inter",
                  fontSize: 18,
                  color: AppColors.blueColor1,
                ),
              ),
              contentPadding: const EdgeInsets.all(20),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DropdownButtonFormField<String>(
                      initialValue: tipoSelecionado,
                      items: tipos
                          .map(
                            (t) => DropdownMenuItem(
                              value: t,
                              child: Text(
                                formatarTipo(t),
                                style: const TextStyle(fontFamily: "Inter"),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (val) =>
                          setModalState(() => tipoSelecionado = val),
                    ),
                    DropdownButtonFormField<String>(
                      initialValue: areaSelecionada,
                      items: areas
                          .map(
                            (a) => DropdownMenuItem(
                              value: a,
                              child: Text(
                                formatarArea(a),
                                style: const TextStyle(fontFamily: "Inter"),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (val) =>
                          setModalState(() => areaSelecionada = val),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: descricaoController,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        labelText: "Descrição",
                        labelStyle: TextStyle(fontFamily: "Inter"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: localController,
                      decoration: const InputDecoration(
                        labelText: "Local",
                        labelStyle: TextStyle(fontFamily: "Inter"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      icon: const Icon(
                        Icons.attach_file,
                        color: AppColors.iceWhiteColor,
                      ),
                      label: const Text(
                        "Selecionar Nova Mídia",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontFamily: "Inter",
                          fontSize: 14,
                          color: AppColors.iceWhiteColor,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blueColor1,
                      ),
                      onPressed: () async {
                        final picker = ImagePicker();
                        final pickedFile = await picker.pickImage(
                          source: ImageSource.gallery,
                        );
                        if (pickedFile != null) {
                          setModalState(
                            () => novaMidia = File(pickedFile.path),
                          );
                        }
                      },
                    ),
                    if (novaMidia != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Arquivo: ${novaMidia!.path.split('/').last}",
                          style: const TextStyle(fontFamily: "Inter"),
                        ),
                      ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    "Cancelar",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: "Inter",
                      fontSize: 14,
                      color: AppColors.blueColor1,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      FormData formData = FormData.fromMap({
                        'tipo': tipoSelecionado,
                        'area': areaSelecionada,
                        'descricao': descricaoController.text,
                        'local': localController.text,
                        'email': manifestacao['email'],
                        'dataCriacao': DateTime.now().toIso8601String(),
                        if (novaMidia != null)
                          'arquivo': await MultipartFile.fromFile(
                            novaMidia!.path,
                          ),
                      });

                      final response = await Dio().put(
                        'https://api-ouvidoria-blucidadao-production.up.railway.app/api/manifestacoes/upload/${manifestacao['id']}',
                        data: formData,
                      );

                      if (response.statusCode == 200) {
                        setState(() {
                          final index = _historico.indexWhere(
                            (m) => m['id'] == manifestacao['id'],
                          );
                          if (index != -1) {
                            _historico[index] = response.data;
                          }
                        });
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Manifestação atualizada com sucesso!",
                            ),
                          ),
                        );
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Erro ao atualizar: $e")),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blueColor1,
                  ),
                  child: const Text(
                    "Salvar",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Inter",
                      fontSize: 14,
                      color: AppColors.iceWhiteColor,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> selecionarMidia() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _midiaSelecionada = File(pickedFile.path);
      });
    }
  }

  Widget buildHistoricoItem(dynamic manifestacao) {
    return Card(
      color: AppColors.lightGrey,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Protocolo: ${manifestacao['protocolo']}',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontFamily: "Inter",
                fontSize: 14,
                color: AppColors.blueColor1,
              ),
            ),
            Text(
              'Tipo: ${formatarTipo(manifestacao['tipo'])}',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontFamily: "Inter",
                fontSize: 14,
                color: AppColors.blueColor1,
              ),
            ),
            Text(
              'Área: ${formatarArea(manifestacao['area'])}',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontFamily: "Inter",
                fontSize: 14,
                color: AppColors.blueColor1,
              ),
            ),
            Text(
              'Descrição: ${manifestacao['descricao']}',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontFamily: "Inter",
                fontSize: 14,
                color: AppColors.blueColor1,
              ),
            ),
            Text(
              'Local: ${manifestacao['local'] ?? 'Não informado'}',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontFamily: "Inter",
                fontSize: 14,
                color: AppColors.blueColor1,
              ),
            ),
            Text(
              'Email: ${manifestacao['email']}',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontFamily: "Inter",
                fontSize: 14,
                color: AppColors.blueColor1,
              ),
            ),
            Text(
              'Status: ${manifestacao['status']}',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontFamily: "Inter",
                fontSize: 14,
                color: AppColors.blueColor1,
              ),
            ),
            Text(
              'Data: ${manifestacao['dataCriacao'] ?? 'Automática'}',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontFamily: "Inter",
                fontSize: 14,
                color: AppColors.blueColor1,
              ),
            ),
            manifestacao['midiaUrl'] != null
                ? TextButton(
                    onPressed: () {
                      launchUrl(Uri.parse(manifestacao['midiaUrl']));
                    },
                    child: const Text(
                      'Ver mídia',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter",
                        fontSize: 14,
                        color: AppColors.blueColor1,
                      ),
                    ),
                  )
                : const Text('Mídia: Nenhuma'),
            const SizedBox(height: 8),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => atualizarManifestacao(manifestacao),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blueColor1,
                  ),
                  child: const Text(
                    "Atualizar",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Inter",
                      fontSize: 14,
                      color: AppColors.iceWhiteColor,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => excluirManifestacao(manifestacao['id']),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[900],
                  ),
                  child: const Text(
                    "Excluir",
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
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
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
                      'Nova Manifestação',
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      const Text(
                        'Tipo:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Inter",
                          fontSize: 16,
                          color: AppColors.blueColor1,
                        ),
                      ),
                      DropdownButtonFormField<String>(
                        initialValue: _tipoSelecionado,
                        items: tipos.map((tipo) {
                          return DropdownMenuItem(
                            value: tipo,
                            child: Text(formatarTipo(tipo)),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            _tipoSelecionado = value;
                          });
                        },
                        validator: (val) =>
                            val == null ? 'Campo obrigatório' : null,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.blueColor1),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.blueColor1),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Área:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Inter",
                          fontSize: 14,
                          color: AppColors.blueColor1,
                        ),
                      ),
                      DropdownButtonFormField<String>(
                        initialValue: _areaSelecionada,
                        items: areas.map((area) {
                          return DropdownMenuItem(
                            value: area,
                            child: Text(formatarArea(area)),
                          );
                        }).toList(),
                        onChanged: (val) =>
                            setState(() => _areaSelecionada = val),
                        validator: (val) =>
                            val == null ? 'Campo obrigatório' : null,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.blueColor1),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.blueColor1),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Descrição:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Inter",
                          fontSize: 14,
                          color: AppColors.blueColor1,
                        ),
                      ),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: _descricaoController,
                        maxLines: 5,
                        decoration: const InputDecoration(
                          hintText: 'Descreva sua solicitação...',
                          border: OutlineInputBorder(),
                        ),
                        validator: (val) => val == null || val.isEmpty
                            ? 'Campo obrigatório'
                            : null,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Local:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Inter",
                          fontSize: 14,
                          color: AppColors.blueColor1,
                        ),
                      ),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: _localController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Email:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Inter",
                          fontSize: 14,
                          color: AppColors.blueColor1,
                        ),
                      ),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        validator: (val) => val == null || val.isEmpty
                            ? 'Campo obrigatório'
                            : null,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Mídia:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: [
                            ElevatedButton.icon(
                              onPressed: selecionarMidia,
                              icon: const Icon(
                                Icons.attach_file,
                                color: AppColors.iceWhiteColor,
                              ),
                              label: const Text(
                                'Escolher mídia',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontFamily: "Inter",
                                  fontSize: 14,
                                  color: AppColors.iceWhiteColor,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.blueColor1,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                _midiaSelecionada != null
                                    ? _midiaSelecionada!.path.split('/').last
                                    : 'Nenhum arquivo',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: enviarManifestacao,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.blueColor1,
                        ),
                        child: const Text(
                          'Enviar Manifestação',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Inter",
                            fontSize: 14,
                            color: AppColors.iceWhiteColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Divider(),
                      const SizedBox(height: 24),
                      const Text(
                        'Histórico de Manifestações:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Inter",
                          fontSize: 18,
                          color: AppColors.blueColor1,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ..._historico.map(buildHistoricoItem),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
