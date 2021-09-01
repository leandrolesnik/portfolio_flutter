import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kinsel',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        textTheme: GoogleFonts.notoSansTextTheme(),
      ),
      home: AnimatedSplashScreen(
        duration: 3000,
        splashTransition: SplashTransition.fadeTransition,
        curve: Curves.easeIn,
        animationDuration: Duration(seconds: 3),
        centered: true,
        backgroundColor: Colors.black,
        splash: Center(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.center,
                matchTextDirection: true,
                repeat: ImageRepeat.noRepeat,
                image: AssetImage("assets/images/splash.png"),
              ),
            ),
            // child: Image.asset("assets/image/splash.png"),
          ),
        ),
        nextScreen: Home(),
      ),
      // home: Home(),
    );
  }
}
