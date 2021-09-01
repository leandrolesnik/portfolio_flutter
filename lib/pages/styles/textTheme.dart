import 'package:flutter/material.dart';

class EstiloTexto {
  static const TextStyle texto = TextStyle(
      fontWeight: FontWeight.w400,
      color: Colors.blueGrey,
      fontFamily: 'sans-serif-condensed');

  static const TextStyle titulo = TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.blueGrey,
      fontFamily: 'sans-serif-condensed');

  static const TextStyle titulo2 = TextStyle(
      fontSize: 24,
      letterSpacing: 2,
      fontWeight: FontWeight.bold,
      color: Colors.deepOrange,
      fontFamily: 'sans-serif-condensed');

  static const TextStyle textBottom = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: 'sans-serif-condensed',
    letterSpacing: 2,
  );
  static const TextStyle tituloTop = TextStyle(
    color: Colors.white,
    fontSize: 28,
    letterSpacing: 2,
    fontWeight: FontWeight.w200,
  );

  static const TextStyle textMiddle = TextStyle(
    color: Colors.white,
    fontSize: 18,
  );

  static const TextStyle hiddenTitulo = TextStyle(
    color: Colors.white,
    fontSize: 28,
    fontWeight: FontWeight.bold,
    fontFamily: 'sans-serif-condensed',
    letterSpacing: 2,
  );

  static const TextStyle hiddenTexto = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w100,
    fontFamily: 'sans-serif-condensed',
    fontSize: 20,
  );
}
