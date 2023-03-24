import 'package:agenda/components/box/index.dart';
import 'package:agenda/components/button/button.dart';
import 'package:agenda/comum/styles/consts.dart';
import 'package:agenda/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Box(
          width: 100.w,
          height: 100.h,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.px),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Bem-vindo(a)!',
                  style: GoogleFonts.getFont(
                    'Montserrat',
                    textStyle: TextStyle(
                      fontSize: 4.vmax,
                      fontWeight: FontWeight.bold,
                      color: colorAppBar,
                    ),
                  ),
                ),
                Text(
                  'Performance+ é um sistema para\ngerenciamento de tarefas.\nAqui você poderá realizar\ntarefas para melhoras a sua produtividade\n.',
                  style: GoogleFonts.getFont(
                    'Montserrat',
                    textStyle: TextStyle(
                      fontSize: 2.vmax,
                      color: colorAppBar,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
                Image.asset('assets/landing.jpg'),
                Button(
                  title: 'Iniciar',
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  },
                  margin: 0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
