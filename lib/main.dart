import 'package:flutter/material.dart';

void main() => runApp(PerguntaApp());

class PerguntaApp extends StatelessWidget {
  PerguntaApp({super.key});

  bool isActive = false;

  void responder() {
   debugPrint('Pergunta respondida!');
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
            Text(perguntas[0]),
             ElevatedButton(
              onPressed:  isActive ? responder : null,
              child: const Text('Resposta 1'),
            ),
            ElevatedButton(
              onPressed: responder,
              child: const Text('Resposta 2'),
            ),
            ElevatedButton(
              onPressed: () {
                debugPrint('Pergunta resondida 3');
              },
              child: const Text('Resposta 3'),
            ),
            ElevatedButton(
              onPressed: () => debugPrint('Pergunta resondida'),
              child: const Text('Resposta 4'),
            ),
          ],
        ),
      ),
    );
  }
}
