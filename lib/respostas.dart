import 'package:flutter/material.dart';

//criamos esse novo componente TextButton para reduzir o tamanho do codigo
// na main e assim poder reutilizar esse componente respostas
class Respostas extends StatelessWidget {
  final String? texto;
  final void Function()
      quandoSelecionado; //funcao que é chamada quando onPressed é selecionado

  //construtor
  const Respostas(
    this.texto,
    this.quandoSelecionado, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (10 *
          30), //double.infinity tem o mesmo tamanho, (10 * 40) tb é outra opcao
      child: ElevatedButton(
        onPressed: quandoSelecionado,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              Colors.blueAccent), //para alterar a cor do botao
        ),
        child: Text(
          texto!,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
