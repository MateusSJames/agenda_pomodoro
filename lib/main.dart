import 'package:agenda/screens/home_screen/home_screen.dart';
import 'package:agenda/screens/welcome/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(
    ResponsiveSizer(builder: (context, orientation, screenType) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomeScreen(),
        localizationsDelegates: [
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('pt', 'BR'),
        ],
      ); 
    })
  );
}
