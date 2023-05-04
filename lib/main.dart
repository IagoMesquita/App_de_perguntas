import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() => runApp(const PerguntaApp());

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});
  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  // _PerguntaAppState();

  int _perguntaSelecionada = 0;

  // objct é um type mais generico, servindo para String, List ...
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual seu animal favorito?',
      'respostas': ['Lobo', 'Aguia', 'Cavalo', 'Tigre']
    },
    {
      'texto': 'Qual sua cor favorito?',
      'respostas': ['Verde', 'Azul', 'Preto', 'Braco']
    },
    {
      'texto': 'Qual seu professor favorito?',
      'respostas': ['Leo', 'Guanabara', 'Felipe', 'Matheus']
    },
  ];

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    // Abordagem declarativa, programacao funcional
    // List<Widget> widgets = respostas.map((r) => Resposta(r, _responder)).toList();

    // I - forma imperativa
    // for(String textoResposta in perguntas[_perguntaSelecionada].cast()['resposta'] ) {
    //   respostas.add(Resposta(textoResposta, _responder));
    // }

    // for(String textoResposta in respostas) {
    //   widgets.add(Resposta(textoResposta, _responder));
    // };

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : const Resultado(),
      ),
    );
  }
}
