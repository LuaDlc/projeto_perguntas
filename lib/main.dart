import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/respostas.dart';
import 'package:projeto_perguntas/resultado.dart';

void main() => runApp(const PerguntaApp());

//extend stateless é oq torna a classe um widget
class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final List<Map> _perguntas = [
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

  //funcao get que retorna a perguntaSelecionada sendo menor que o tamanho da lista perguntas
  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String?> respostas =
        temPerguntaSelecionada // se a pergunta estiver sido selecionada reporta outra pergunta
            ? _perguntas[_perguntaSelecionada]['respostas']
            : [];

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
                ? Column(
                    children: [
                      Questao(_perguntas[_perguntaSelecionada]['texto']),
                      const SizedBox(height: 8.0),
                      const SizedBox(height: 8.0),
                      ...respostas
                          .map((t) => Respostas(t, _responder))
                          .toList(), // essa é a lista com as repostas, os ... adiciona essa lista dentro de outra lista perguntas
                    ],
                  )
                : const Resultado() //será uma pagina talvez com o numero de acertos
            ));
  }
}
