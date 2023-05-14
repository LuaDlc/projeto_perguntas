import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/respostas.dart';

void main() => runApp(const PerguntaApp());

//extend stateless é oq torna a classe um widget
class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      'Qual é a sua cor favorita?',
      'Qual é  seu animal favorito?',
    ];
    //criando uma isntancia
    return MaterialApp(
        //recebe parametros noemados
        home: Scaffold(
      appBar: AppBar(
        title: const Text(
            //o texto perguntas é um parametro posicional
            'perguntas'),
      ),
      //outro componente dentro do scaffold
      body: Column(
        children: [
          Questao(perguntas[_perguntaSelecionada]),
          const SizedBox(height: 8.0),
          const SizedBox(height: 8.0),
          Respostas('resposta 1', _responder),
          Respostas('resposta 2', _responder),
          Respostas('resposta 3', _responder),
        ],
      ),
    ));
  }
}
