import 'package:flutter/material.dart';

void main() => runApp(PerguntaApp());

class PerguntaApp extends StatelessWidget {
  PerguntaApp({super.key});

  bool isActive = false;

  int perguntaSelecionada = 1;

  void responder() {
   perguntaSelecionada++;
   print(perguntaSelecionada);
  }

  final List<String> perguntas = [
    'Qual sua cor favorita?',
    'Qual seu animal favorito?'
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
            Text(perguntas[perguntaSelecionada]),
             ElevatedButton(
              onPressed: responder,
              child: const Text('Resposta 1'),
            ),
            ElevatedButton(
              onPressed: responder,
              child: const Text('Resposta 2'),
            ),
            ElevatedButton(
              onPressed: responder,
              child: const Text('Resposta 3'),
            ),
          ],
        ),
      ),
    );
  }
}
