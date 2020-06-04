import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './screens/home_screen.dart';
import './constants/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neu Calci',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: MyColors.bgColor,
        canvasColor: MyColors.bgColor,
        textTheme: TextTheme(
          subtitle1:  GoogleFonts.merriweather(
            color: Colors.white,
            fontSize: 40.0,
            fontWeight: FontWeight.w900,
          ),
          bodyText1: GoogleFonts.merriweather(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w900,
          ),
          bodyText2: GoogleFonts.merriweather(
            color: MyColors.secondaryFontColor,
            fontSize: 20.0,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
