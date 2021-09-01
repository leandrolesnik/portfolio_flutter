import 'package:flutter/material.dart';
import 'package:kinsel/pages/hidden.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'styles/textTheme.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  String? mensagem;
  int cheat = 0;
  String? codigo;
  String cor = "";
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  late final AnimationController _controller2 = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> elasticInOut = CurvedAnimation(
    parent: _controller2,
    curve: Curves.elasticInOut,
  );
  late final Animation<double> efeitoDecelerate = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );
  late final Animation<double> efeitoEaseInOut = CurvedAnimation(
    parent: _controller2,
    curve: Curves.easeInOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int clique = 0;

  @override
  Widget build(BuildContext context) {
// FUNCAO POPUP
    Widget? popUp(
      String imagem1,
      String imagem2,
      String imagem3,
      String titulo,
      String texto,
      String tecnologia,
    ) {
      showDialog(
        context: context,
        barrierColor: Colors.black.withOpacity(.85),
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            contentPadding: EdgeInsets.all(0),
            insetPadding: EdgeInsets.all(10),
            content: Container(
              color: Colors.deepOrange,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      //IMAGEM 1 - BG
                      Container(
                        child: Image.asset(
                          imagem1,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 300),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // IMAGEM 2 - BOX1
                            InkWell(
                              onTap: () {
                                showDialog(
                                  barrierColor: Colors.black.withOpacity(.9),
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      child: AlertDialog(
                                        scrollable: true,
                                        shape: Border.all(
                                            color: Colors.white10, width: 1),
                                        insetPadding: EdgeInsets.all(10),
                                        contentPadding: EdgeInsets.all(0),
                                        content: Image.asset(
                                          imagem2,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.deepOrange, width: 5),
                                ),
                                width: 165,
                                height: 140,
                                child: Image.asset(
                                  imagem2,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                            // IMAGEM 3 - BOX2
                            InkWell(
                              onTap: () {
                                showDialog(
                                  barrierColor: Colors.black.withOpacity(.9),
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      child: AlertDialog(
                                        scrollable: true,
                                        shape: Border.all(
                                            color: Colors.white10, width: 1),
                                        insetPadding: EdgeInsets.all(10),
                                        contentPadding: EdgeInsets.all(0),
                                        content: Image.asset(
                                          imagem3,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.deepOrange, width: 5),
                                ),
                                width: 165,
                                height: 140,
                                child: Image.asset(
                                  imagem3,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // TITULO DO CONTEUDO DO BOX
                  Container(
                    alignment: AlignmentDirectional.bottomStart,
                    height: 100,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    margin: EdgeInsets.only(top: 10),
                    color: Colors.black,
                    child: Text(
                      titulo,
                      style: EstiloTexto.tituloTop,
                    ),
                  ),
                  // TEXTO DO CONTEUDO DO BOX
                  Container(
                    height: 100,
                    alignment: AlignmentDirectional.centerStart,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Text(texto, style: EstiloTexto.textMiddle),
                  ),
                  // TECNOLOGIA DO CONTEUDO DO BOX
                  Container(
                    color: Colors.black12,
                    alignment: AlignmentDirectional.bottomCenter,
                    padding: EdgeInsets.all(10),
                    // color: Colors.blueGrey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          tecnologia,
                          style: EstiloTexto.textBottom,
                        ),
                        InkWell(
                          onTap: () =>
                              Navigator.pop(context, true), // passing true
                          child: Text(
                            'Fechar',
                            style: EstiloTexto.textBottom,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Leandro Lesnik"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          /** PRIMEIRO BLOCO **/
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(1),
                              child: InkWell(
                                onTap: () {
                                  popUp(
                                    "assets/images/html/cinebg.png",
                                    "assets/images/html/cine.png",
                                    "assets/images/html/cine02.png",
                                    "Cine SoulCode",
                                    "A propósta era criar um site para uma sala de cinema.",
                                    "HTML5 / CSS",
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/html/cine_icon.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Container(
                                    child: FadeTransition(
                                      opacity: efeitoEaseInOut,
                                      child: Container(
                                          color: Colors.amber.withOpacity(.4)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          /** TERCEIRO BLOCO **/
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(1),
                                    child: InkWell(
                                      onTap: () {
                                        popUp(
                                            "assets/images/html/waybackbg.png",
                                            "assets/images/html/wayback01.png",
                                            "assets/images/html/wayback02.png",
                                            "Wayback Machine",
                                            "A propósta era criar um site usando os conhecimentos adiquiridos nas aulas.",
                                            "HTML5 / CSS");
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/html/wayback_icon.png"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: Container(
                                          child: FadeTransition(
                                            opacity: efeitoDecelerate,
                                            child: Container(
                                                color: Colors.white
                                                    .withOpacity(1)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                /** QUARTO BLOCO **/
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(1),
                                    child: InkWell(
                                      onDoubleTap: () {
                                        if (cheat >= 0) {
                                          cheat = 1;
                                        }
                                        print(cheat);
                                      },
                                      child: Container(
                                        color: Colors.yellowAccent,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          /** SETIMO BLOCO **/
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(1),
                              child: InkWell(
                                onTap: () {
                                  popUp(
                                      "assets/images/react_native/soulmilibg.png",
                                      "assets/images/react_native/soulmili.png",
                                      "assets/images/react_native/soulmili2.png",
                                      "Soul Mili",
                                      "A propósta era criar um aplicativo bancário usando os recursos do React Native.",
                                      "REACT NATIVE");
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/react_native/soulmili_icon.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Container(
                                    child: FadeTransition(
                                      opacity: efeitoDecelerate,
                                      child: Container(
                                          color: Colors.white.withOpacity(.1)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    /** SEGUNDO BLOCO **/
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(1),
                              child: InkWell(
                                onTap: () {
                                  popUp(
                                    "assets/images/css/desafiobg.png",
                                    "assets/images/css/desafio01.png",
                                    "assets/images/css/desafio02.png",
                                    "Desafio",
                                    "A propósta era passar o desenho de um layout para html e css.",
                                    "HTML5 / CSS ",
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/css/desafio_icon.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Container(
                                    child: FadeTransition(
                                      opacity: efeitoEaseInOut,
                                      child: Container(
                                          color: Color(0xFF00cbfe)
                                              .withOpacity(.9)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      /** QUINTO BLOCO **/
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.all(1),
                                          child: InkWell(
                                            onTap: () {
                                              popUp(
                                                "assets/images/react_native/healthbg.png",
                                                "assets/images/react_native/health01.png",
                                                "assets/images/react_native/health02.png",
                                                "SoulHealth",
                                                "A propósta era criar um aplicativo com dicas de saúde usando o React Native.",
                                                "REACT NATIVE",
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/react_native/health_icon.png"),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              child: Container(
                                                child: FadeTransition(
                                                  opacity: efeitoDecelerate,
                                                  child: Container(
                                                      color: Colors.black
                                                          .withOpacity(.3)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      /** OITAVO BLOCO **/
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(1),
                                          child: InkWell(
                                            onTap: () {
                                              popUp(
                                                  "assets/images/css/kwacaibg.png",
                                                  "assets/images/css/kwacai01.png",
                                                  "assets/images/css/kwacai02.png",
                                                  "Kwaçái",
                                                  "A propósta era criar um site para um comércio de venda de açaí.",
                                                  "HTML5 / CSS");
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/css/kwacai_icon.png"),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              child: Container(
                                                child: FadeTransition(
                                                  opacity: efeitoDecelerate,
                                                  child: Container(
                                                      color: Colors.red
                                                          .withOpacity(.8)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      /** SEXTO BLOCO **/

                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(1),
                                          child: InkWell(
                                            onTap: () {
                                              popUp(
                                                  "assets/images/bootstrap/bootstrapbg.png",
                                                  "assets/images/bootstrap/bootstrap01.png",
                                                  "assets/images/bootstrap/bootstrap02.png",
                                                  "Layout",
                                                  "A propósta era criar um layout usando os conhecimentos adiquiridos nas aulas.",
                                                  "HTML5 / CSS / BOOTSTRAP");
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/bootstrap/bootstrap_icon.png"),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              child: Container(
                                                child: FadeTransition(
                                                  opacity: elasticInOut,
                                                  child: Container(
                                                      color: Colors.teal
                                                          .withOpacity(1)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      // BOX 09
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.all(1),
                                          child: InkWell(
                                            onLongPress: () {
                                              if (cheat == 2) {
                                                showDialog(
                                                  context: context,
                                                  barrierColor: Colors.black
                                                      .withOpacity(.85),
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      scrollable: true,
                                                      contentPadding:
                                                          EdgeInsets.all(0),
                                                      insetPadding:
                                                          EdgeInsets.all(10),
                                                      content: Container(
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        color: Colors.black,
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        child: Expanded(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .stretch,
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        20),
                                                                child: Text(
                                                                  "Entre com o Kódigo",
                                                                  style: EstiloTexto
                                                                      .titulo2,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ),
                                                              Container(
                                                                child:
                                                                    TextFormField(
                                                                  decoration:
                                                                      InputDecoration(
                                                                          fillColor: Colors
                                                                              .white,
                                                                          filled:
                                                                              true,
                                                                          border:
                                                                              OutlineInputBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(25),
                                                                          )),
                                                                  maxLines: 1,
                                                                  onChanged:
                                                                      (text) =>
                                                                          codigo =
                                                                              text,
                                                                ),
                                                              ),
                                                              Text(
                                                                cor,
                                                                style: EstiloTexto
                                                                    .hiddenTitulo,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                              const SizedBox(
                                                                height: 20,
                                                              ),
                                                              Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child:
                                                                    OutlinedButton(
                                                                  onPressed:
                                                                      () {
                                                                    if (codigo ==
                                                                        "ccbbtftfba") {
                                                                      cor = "";
                                                                      Navigator
                                                                          .push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                Hidden()),
                                                                      );
                                                                    } else {
                                                                      cor =
                                                                          "Código inválido";
                                                                    }
                                                                  },
                                                                  style: OutlinedButton
                                                                      .styleFrom(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .blueGrey,
                                                                    primary: Colors
                                                                        .deepOrange,
                                                                    side: BorderSide(
                                                                        width:
                                                                            2,
                                                                        color: Colors
                                                                            .blueGrey),
                                                                  ),
                                                                  child: Text(
                                                                    'Enviar',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 20,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              } else {
                                                cheat = 0;
                                              }
                                            },
                                            child: Container(
                                              color: Colors.deepOrange,
                                              // color: Colors.black54,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // BOX 10
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(1),
                              child: InkWell(
                                onTap: () {
                                  popUp(
                                      "assets/images/react_native/merceariabg.png",
                                      "assets/images/react_native/mercearia01.png",
                                      "assets/images/react_native/mercearia02.png",
                                      "Mercantil \nCruzeiro Frios",
                                      "A propósta era criar um aplicativo para uma mercearia.",
                                      "REACT NATIVE");
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/react_native/mercearia_icon.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Container(
                                    child: FadeTransition(
                                      opacity: elasticInOut,
                                      child: Container(
                                          color:
                                              Colors.deepPurple.withOpacity(1)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // BOX 11
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(1),
                              child: InkWell(
                                onTap: () {
                                  if (cheat == 1) {
                                    cheat += 1;
                                  } else {
                                    cheat = 0;
                                  }
                                  print(cheat);
                                },
                                child: Container(
                                  color: Color(0xFF00CCFF),
                                  // color: Colors.black54,
                                ),
                              ),
                            ),
                          ),
                          // BOX 12
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(1),
                              child: InkWell(
                                onTap: () {
                                  popUp(
                                      "assets/images/html/receitatasbg.png",
                                      "assets/images/html/receitatas01.png",
                                      "assets/images/html/receitatas02.png",
                                      "Receitatas",
                                      "A propósta era criar um site de receitas.",
                                      "HTML5 / CSS");
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/html/receitatas_icon.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Container(
                                    child: FadeTransition(
                                      opacity: elasticInOut,
                                      child: Container(
                                          color: Colors.yellow.withOpacity(.2)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // BOX 13
                    /*** SOBRE MIM ***/
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(1),
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              barrierColor: Colors.black.withOpacity(.85),
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  scrollable: true,
                                  contentPadding: EdgeInsets.all(0),
                                  insetPadding: EdgeInsets.all(5),
                                  content: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Colors.purple.withAlpha(50),
                                          Colors.orange.withAlpha(50),
                                        ],
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                /** COLUNA DE DESCRICAO */
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      alignment:
                                                          AlignmentDirectional
                                                              .centerStart,
                                                      child: Text(
                                                        "Informações",
                                                        style:
                                                            EstiloTexto.titulo2,
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Nome",
                                                          style: EstiloTexto
                                                              .titulo,
                                                        ),
                                                        Text(
                                                          "Leandro Lesnik",
                                                          style:
                                                              EstiloTexto.texto,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Espécie",
                                                          style: EstiloTexto
                                                              .titulo,
                                                        ),
                                                        Text(
                                                          "Humano",
                                                          style:
                                                              EstiloTexto.texto,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Tipo",
                                                          style: EstiloTexto
                                                              .titulo,
                                                        ),
                                                        Text(
                                                          "Planta",
                                                          style:
                                                              EstiloTexto.texto,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Treinador",
                                                          style: EstiloTexto
                                                              .titulo,
                                                        ),
                                                        Text(
                                                          "SoulCode",
                                                          style:
                                                              EstiloTexto.texto,
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          AlignmentDirectional
                                                              .centerStart,
                                                      child: Text(
                                                        "Descrição",
                                                        style:
                                                            EstiloTexto.titulo2,
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          AlignmentDirectional
                                                              .centerStart,
                                                      child: Text(
                                                        "Tipo raro, só existe 1 no mundo. Se adapta rapidamente ao ambiente.",
                                                        style:
                                                            EstiloTexto.texto,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20),
                                                child: Container(
                                                  width: 160,
                                                  height: 160,
                                                  child: Image.asset(
                                                      "assets/images/olho01.jpg"),
                                                ),
                                              ),
                                              // Image.asset(
                                              //     "asstes/html/cine_icon.jpg"),
                                              // ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          /** COLUNA DE ATRIBUTOS */
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "Atributos",
                                                      style:
                                                          EstiloTexto.titulo2,
                                                      textAlign: TextAlign.left,
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Criatividade",
                                                          style: EstiloTexto
                                                              .titulo,
                                                        ),
                                                        LinearPercentIndicator(
                                                          width: 75.0,
                                                          lineHeight: 14.0,
                                                          percent: 0.7,
                                                          animation: true,
                                                          animationDuration:
                                                              5000,
                                                          backgroundColor: Colors
                                                              .deepOrangeAccent
                                                              .shade100,
                                                          progressColor:
                                                              Colors.deepOrange,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Colaboração",
                                                          style: EstiloTexto
                                                              .titulo,
                                                        ),
                                                        LinearPercentIndicator(
                                                          width: 75.0,
                                                          lineHeight: 14.0,
                                                          percent: 0.8,
                                                          animation: true,
                                                          animationDuration:
                                                              5000,
                                                          backgroundColor: Colors
                                                              .deepOrangeAccent
                                                              .shade100,
                                                          progressColor:
                                                              Colors.deepOrange,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Empatia",
                                                          style: EstiloTexto
                                                              .titulo,
                                                        ),
                                                        LinearPercentIndicator(
                                                          width: 75.0,
                                                          lineHeight: 14.0,
                                                          percent: 0.8,
                                                          animation: true,
                                                          animationDuration:
                                                              5000,
                                                          backgroundColor: Colors
                                                              .deepOrangeAccent
                                                              .shade100,
                                                          progressColor:
                                                              Colors.deepOrange,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Resiliência",
                                                          style: EstiloTexto
                                                              .titulo,
                                                        ),
                                                        LinearPercentIndicator(
                                                          width: 75.0,
                                                          lineHeight: 14.0,
                                                          percent: 0.8,
                                                          animation: true,
                                                          animationDuration:
                                                              5000,
                                                          backgroundColor: Colors
                                                              .deepOrangeAccent
                                                              .shade100,
                                                          progressColor:
                                                              Colors.deepOrange,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Inteligência",
                                                          style: EstiloTexto
                                                              .titulo,
                                                        ),
                                                        LinearPercentIndicator(
                                                          width: 75.0,
                                                          lineHeight: 14.0,
                                                          percent: 0.7,
                                                          animation: true,
                                                          animationDuration:
                                                              5000,
                                                          backgroundColor: Colors
                                                              .deepOrangeAccent
                                                              .shade100,
                                                          progressColor:
                                                              Colors.deepOrange,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Espírito",
                                                          style: EstiloTexto
                                                              .titulo,
                                                        ),
                                                        LinearPercentIndicator(
                                                          width: 75.0,
                                                          lineHeight: 14.0,
                                                          percent: 0.6,
                                                          animation: true,
                                                          animationDuration:
                                                              5000,
                                                          backgroundColor: Colors
                                                              .deepOrangeAccent
                                                              .shade100,
                                                          progressColor:
                                                              Colors.deepOrange,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Sorte",
                                                          style: EstiloTexto
                                                              .titulo,
                                                        ),
                                                        LinearPercentIndicator(
                                                          width: 75.0,
                                                          lineHeight: 14.0,
                                                          percent: 0.5,
                                                          animation: true,
                                                          animationDuration:
                                                              5000,
                                                          backgroundColor: Colors
                                                              .deepOrangeAccent
                                                              .shade100,
                                                          progressColor:
                                                              Colors.deepOrange,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              /*** HABILIDADE ***/
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "Habilidades",
                                                      style:
                                                          EstiloTexto.titulo2,
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "HTML",
                                                          style: EstiloTexto
                                                              .titulo,
                                                        ),
                                                        LinearPercentIndicator(
                                                          width: 75.0,
                                                          lineHeight: 14.0,
                                                          percent: 0.9,
                                                          animation: true,
                                                          animationDuration:
                                                              5000,
                                                          backgroundColor: Colors
                                                              .deepOrangeAccent
                                                              .shade100,
                                                          progressColor:
                                                              Colors.deepOrange,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "CSS",
                                                          style: EstiloTexto
                                                              .titulo,
                                                        ),
                                                        LinearPercentIndicator(
                                                          width: 75.0,
                                                          lineHeight: 14.0,
                                                          percent: 0.9,
                                                          animation: true,
                                                          animationDuration:
                                                              5000,
                                                          backgroundColor: Colors
                                                              .deepOrangeAccent
                                                              .shade100,
                                                          progressColor:
                                                              Colors.deepOrange,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Javascript",
                                                          style: EstiloTexto
                                                              .titulo,
                                                        ),
                                                        LinearPercentIndicator(
                                                          width: 75.0,
                                                          lineHeight: 14.0,
                                                          percent: 0.6,
                                                          animation: true,
                                                          animationDuration:
                                                              5000,
                                                          backgroundColor: Colors
                                                              .deepOrangeAccent
                                                              .shade100,
                                                          progressColor:
                                                              Colors.deepOrange,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Bootstrap",
                                                          style: EstiloTexto
                                                              .titulo,
                                                        ),
                                                        LinearPercentIndicator(
                                                          width: 75.0,
                                                          lineHeight: 14.0,
                                                          percent: 0.7,
                                                          animation: true,
                                                          animationDuration:
                                                              5000,
                                                          backgroundColor: Colors
                                                              .deepOrangeAccent
                                                              .shade100,
                                                          progressColor:
                                                              Colors.deepOrange,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Jquery",
                                                          style: EstiloTexto
                                                              .titulo,
                                                        ),
                                                        LinearPercentIndicator(
                                                          width: 75.0,
                                                          lineHeight: 14.0,
                                                          percent: 0.2,
                                                          animation: true,
                                                          animationDuration:
                                                              5000,
                                                          backgroundColor: Colors
                                                              .deepOrangeAccent
                                                              .shade100,
                                                          progressColor:
                                                              Colors.deepOrange,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "React Native",
                                                          style: EstiloTexto
                                                              .titulo,
                                                        ),
                                                        LinearPercentIndicator(
                                                          width: 75.0,
                                                          lineHeight: 14.0,
                                                          percent: 0.4,
                                                          animation: true,
                                                          animationDuration:
                                                              5000,
                                                          backgroundColor: Colors
                                                              .deepOrangeAccent
                                                              .shade100,
                                                          progressColor:
                                                              Colors.deepOrange,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Flutter",
                                                          style: EstiloTexto
                                                              .titulo,
                                                        ),
                                                        LinearPercentIndicator(
                                                          width: 75.0,
                                                          lineHeight: 14.0,
                                                          percent: 0.5,
                                                          animation: true,
                                                          animationDuration:
                                                              5000,
                                                          backgroundColor: Colors
                                                              .deepOrangeAccent
                                                              .shade100,
                                                          progressColor:
                                                              Colors.deepOrange,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          // BOTOES DA REDES
                                          Column(
                                            children: [
                                              Container(
                                                child: Text(
                                                  "Onde encontrar?",
                                                  style: EstiloTexto.titulo2,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              // ROW COM OS BOTOES
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  /*** LINKEDIN ***/
                                                  InkWell(
                                                    onTap: () {
                                                      launch(
                                                          'https://www.linkedin.com/in/leandro-lesnik/');
                                                    },
                                                    child: Image.asset(
                                                        "assets/icones/link.png"),
                                                  ),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  /***GITHUB***/
                                                  InkWell(
                                                    onTap: () {
                                                      launch(
                                                          'https://github.com/leandrolesnik');
                                                    },
                                                    child: Image.asset(
                                                        "assets/icones/git.png"),
                                                  ),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  /* INSTAGRAM */
                                                  InkWell(
                                                    onTap: () {
                                                      launch(
                                                          'https://www.instagram.com/leandrolesnik/');
                                                    },
                                                    child: Image.asset(
                                                        "assets/icones/insta.png"),
                                                  ),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  /***WHATSAPP***/
                                                  InkWell(
                                                    onTap: () async {
                                                      showDialog(
                                                        context: context,
                                                        barrierColor: Colors
                                                            .black
                                                            .withOpacity(.85),
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            scrollable: true,
                                                            contentPadding:
                                                                EdgeInsets.all(
                                                                    0),
                                                            insetPadding:
                                                                EdgeInsets.all(
                                                                    10),
                                                            content: Container(
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              color: Colors
                                                                  .deepOrange
                                                                  .shade50,
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8),
                                                              child: Expanded(
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .stretch,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .symmetric(
                                                                          vertical:
                                                                              20),
                                                                      child:
                                                                          Text(
                                                                        "Escreva que eu leio",
                                                                        style: EstiloTexto
                                                                            .titulo2,
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      child:
                                                                          TextField(
                                                                        decoration: InputDecoration(
                                                                            fillColor: Colors.white,
                                                                            filled: true,
                                                                            border: OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(25),
                                                                            )),
                                                                        maxLines:
                                                                            3,
                                                                        onChanged:
                                                                            (text) =>
                                                                                mensagem = text,
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          20,
                                                                    ),
                                                                    Container(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      child:
                                                                          OutlinedButton(
                                                                        onPressed:
                                                                            () async =>
                                                                                await launch("https://wa.me/${5511996038118}?text=$mensagem"),
                                                                        style: OutlinedButton
                                                                            .styleFrom(
                                                                          backgroundColor:
                                                                              Colors.blueGrey,
                                                                          primary:
                                                                              Colors.deepOrange,
                                                                          side: BorderSide(
                                                                              width: 2,
                                                                              color: Colors.blueGrey),
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          'Enviar',
                                                                          style: TextStyle(
                                                                              fontSize: 16,
                                                                              color: Colors.white),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          20,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: Image.asset(
                                                        "assets/icones/whats.png"),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/olho04.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Container(
                              child: FadeTransition(
                                opacity: efeitoEaseInOut,
                                child: Container(
                                    color: Colors.black.withOpacity(.7)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
