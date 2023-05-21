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
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'preto', 'pontuacao': 10},
        {'texto': 'vermelho', 'pontuacaoot': 5},
        {'texto': 'verde', 'pontuacao': 3},
        {'texto': 'branco', 'pontuacao': 1}
      ],
    },
    {
      'texto': 'Qual é  seu animal favorito?',
      'respostas': [
        {'texto': 'coelho', 'pontuacao': 10},
        {'texto': 'cobra', 'pontuacao': 5},
        {'texto': 'elefante', 'pontuacao': 3},
        {'texto': 'leao', 'pontuacao': 1}
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {
          {'texto': 'Joao', 'pontuacao': 10},
          {'texto': 'Maria', 'pontuacao': 5},
          {'texto': 'leo', 'pontuacao': 3},
          {'texto': 'Pedro', 'pontuacao': 1},
        }
      ],
    },
  ];

  void _responder(int? pontuacao) {
    if (temPerguntaSelecionada!) {
      //condicional pra fz a mudanca de estado enquanto houver pergunta
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao!;
      });
    }
    print(_pontuacaoTotal);
  }

  bool? get temPerguntaSelecionada {
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
            body: temPerguntaSelecionada!
                ? Questionario(
                    perguntas: _perguntas,
                    perguntaSelecionada: _perguntaSelecionada,
                    responder: _responder)
                : const Resultado() //será uma pagina talvez com o numero de acertos
            ));
  }
}
