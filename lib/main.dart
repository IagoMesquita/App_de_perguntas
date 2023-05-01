import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

void main() => runApp(const PerguntaApp());

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});
  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  _PerguntaAppState();

  int _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  // objct é um type mais generico, servindo para String, List ...
  final List<Map<String, Object>> perguntas = [
    {
      'texto': 'Qual seu animal favorito?',
      'resposta': ['Lobo', 'Aguia', 'Cavalo', 'Tigre']
    },
    {
      'texto': 'Qual sua cor favorito?',
      'resposta': ['Verde', 'Azul', 'Preto', 'Braco']
    },
    {
      'texto': 'Qual seu professor favorito?',
      'resposta': ['Leo', 'Guanabara', 'Felipe', 'Matheus']
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: Column(
          children: [
            // Questao(texto: perguntas[_perguntaSelecionada]),
            Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
            Resposta('Resposta 1', _responder),
            Resposta('Resposta 2', _responder),
            Resposta('Resposta 3', _responder),
          ],
        ),
      ),
    );
  }
}
