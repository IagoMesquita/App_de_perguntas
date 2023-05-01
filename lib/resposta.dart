import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;

  const Resposta(this.texto, this.quandoSelecionado, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amberAccent,
          padding: const EdgeInsets.all(15),
          foregroundColor: Colors.blueAccent,
          textStyle: const TextStyle(/*color: Colors.blue,*/ fontSize: 20)
        ),
        onPressed: quandoSelecionado,
        child: Text(
          texto,
          // style: const TextStyle(color: Colors.blueAccent, fontSize: 15),
        ),
      ),
    );
  }
}
