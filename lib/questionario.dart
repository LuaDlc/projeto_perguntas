import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/respostas.dart';

class Questionario extends StatelessWidget {
  const Questionario(
      {Key? key,
      required this.perguntas,
      required this.perguntaSelecionada,
      required this.responder})
      : super(key: key);
  final List<Map<String?, Object?>> perguntas;
  final int perguntaSelecionada;
  final void Function() responder;

  //funcao get que retorna a perguntaSelecionada sendo menor que o tamanho da lista perguntas
  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String?> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas'] as List<String>
        : [];
    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['texto'] as String),
        const SizedBox(height: 8.0),
        const SizedBox(height: 8.0),
        ...respostas
            .map((t) => Respostas(t, responder))
            .toList(), // essa é a lista com as repostas, os ... adiciona essa lista dentro de outra lista perguntas
      ],
    );
  }
}
