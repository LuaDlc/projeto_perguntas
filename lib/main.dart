import 'package:flutter/material.dart';

void main() => runApp(const PerguntaApp());

//extend stateless é oq torna a classe um widget
class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;
  void responder() {
    setState(() {
      perguntaSelecionada++;
    });
    print(perguntaSelecionada);
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
          Text(perguntas[perguntaSelecionada]),
          TextButton(
            onPressed: responder,
            child: const Text('resposta 1'),
          ),
          TextButton(
            onPressed: responder,
            child: const Text('resposta 2'),
          ),
          TextButton(
            onPressed: responder,
            child: const Text('resposta 3'),
          ),
        ],
      ),
    ));
  }
}
