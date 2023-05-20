import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resultado.dart';
import 'package:projeto_perguntas/questionario.dart';

void main() => runApp(const PerguntaApp());

//extend stateless é oq torna a classe um widget
class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': ['preto', 'vermelho', 'verde', 'branco'],
    },
    {
      'texto': 'Qual é  seu animal favorito?',
      'respostas': ['coelho', 'cobra', 'elefante', 'leao'],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': ['Maria', 'Joao', 'leo', 'Pedro'],
    },
  ];

  void _responder() {
    if (temPerguntaSelecionada) {
      //condicional pra fz a mudanca de estado enquanto houver pergunta
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
            body: temPerguntaSelecionada
                ? Questionario(
                    perguntas: _perguntas,
                    perguntaSelecionada: _perguntaSelecionada,
                    responder: _responder)
                : const Resultado() //será uma pagina talvez com o numero de acertos
            ));
  }
}
