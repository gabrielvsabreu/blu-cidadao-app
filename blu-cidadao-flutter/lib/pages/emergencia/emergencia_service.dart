import 'emergencia_model.dart';

class EmergenciaService {
  final List<Mensagem> _mensagens = [
    Mensagem(texto: "🚨 Olá! Como posso te ajudar?", ehUsuario: false),
  ];

  List<Mensagem> getMensagens() => _mensagens;

  // 🔹 Função que remove acentos e normaliza
  String _normalizarTexto(String input) {
    return input
        .toLowerCase()
        .replaceAll(RegExp(r'[áàãâä]'), 'a')
        .replaceAll(RegExp(r'[éèêë]'), 'e')
        .replaceAll(RegExp(r'[íìîï]'), 'i')
        .replaceAll(RegExp(r'[óòõôö]'), 'o')
        .replaceAll(RegExp(r'[úùûü]'), 'u')
        .replaceAll(RegExp(r'ç'), 'c');
  }

  void enviarMensagemUsuario(String texto) {
    _mensagens.add(Mensagem(texto: texto, ehUsuario: true));

    final msg = _normalizarTexto(texto);

    // 🔹 Simulação de resposta automática do "chatbot"
    if (msg.contains("policia")) {
      _mensagens.add(
        Mensagem(
          texto: "Vou te conectar com a Polícia Militar (190).",
          ehUsuario: false,
        ),
      );
      _mensagens.add(
        Mensagem(
          texto:
              "Olá, me chamo João da Polícia Militar. O que você gostaria de relatar ou solicitar?",
          ehUsuario: false,
        ),
      );
    } else if (msg.contains("samu") || msg.contains("medico")) {
      _mensagens.add(
        Mensagem(texto: "Acionando o SAMU (192).", ehUsuario: false),
      );
      _mensagens.add(
        Mensagem(
          texto:
              "Olá, me chamo Ana do SAMU. Qual é a emergência e sua localização?",
          ehUsuario: false,
        ),
      );
    } else if (msg.contains("bombeiro")) {
      _mensagens.add(
        Mensagem(
          texto: "Chamando o Corpo de Bombeiros (193).",
          ehUsuario: false,
        ),
      );
      _mensagens.add(
        Mensagem(
          texto:
              "Olá, me chamo Carlos do Corpo de Bombeiros. O que está acontecendo e onde?",
          ehUsuario: false,
        ),
      );
    } else {
      _mensagens.add(
        Mensagem(
          texto:
              "Entendi. Você precisa da Polícia 🚔, SAMU 🚑 ou Bombeiros 🚒?",
          ehUsuario: false,
        ),
      );
    }
  }
}
