import 'package:flutter/material.dart';
import 'styles/textTheme.dart';

class Hidden extends StatelessWidget {
  const Hidden({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 320,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Agradecimentos",
                  style: EstiloTexto.hiddenTitulo,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Muito obrigado a todos meus colegas de turma. Vocês sempre sofram uma inspiração para mim, todo esforço, empenho e dedicação que cada um deu conforme suas forças, e ainda conseguindo um tempo para ajudar os colegas e apoiá-los. Vocês fazem a difereça!",
                  style: EstiloTexto.hiddenTexto,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Aos professores, Almir, Filipe, Leide e William. Estamos no caminho e sonhos serão realizados graças a dedicação, paciência e conhecimentos passados por vocês",
                  style: EstiloTexto.hiddenTexto,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "A SoulCode Academy e todos que estão envolvidos nesse projeto de forma direta e indireta.",
                  style: EstiloTexto.hiddenTexto,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Um agradecimento especial para Thamires Paris. Você trás paz e conforto para o coração, muito obrigado por tudo.",
                  style: EstiloTexto.hiddenTexto,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
