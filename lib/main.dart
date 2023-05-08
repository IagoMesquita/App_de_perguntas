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
  int _pontuacaoTotal = 0;

  // objct é um type mais generico, servindo para String, List ...
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual seu animal favorito?',
      'respostas': [
        {'texto': 'Lobo', 'pontuacao': 10},
        {'texto': 'Aguia', 'pontuacao': 5},
        {'texto': 'Cavalo', 'pontuacao': 3},
        {'texto': 'Tigre', 'pontuacao': 1}
      ]
    },
    {
      'texto': 'Qual sua cor favorito?',
      'respostas': [
        {'texto': 'Verde', 'pontuacao': 10},
        {'texto': 'Azul', 'pontuacao': 5},
        {'texto': 'Preto', 'pontuacao': 3},
        {'texto': 'Braco', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Qual seu professor favorito?',
      'respostas': [
        {'texto': 'Leo', 'pontuacao': 10},
        {'texto': 'Guanabara', 'pontuacao': 5},
        {'texto': 'Felipe', 'pontuacao': 3},
        {'texto': 'Matheus', 'pontuacao': 1},
      ]
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
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
            : Resultado(_pontuacaoTotal,  _reiniciarQuestionario,),
      ),
    );
  }
}
