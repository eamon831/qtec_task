import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalTextView extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final double? fontSize;
  final double? fontWeight;


  const GlobalTextView({super.key, required this.text,this.fontFamily,this.fontSize,this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
       style: GoogleFonts.getFont(fontFamily??'Poppins',
          color: Colors.black,
          fontSize: fontSize??13,
          fontWeight: fontWeight !=null ?defaultFontWeight[fontWeight] :FontWeight.w400,
        ),

    );
  }
}

Map<int, FontWeight> defaultFontWeight = {
  100: FontWeight.w100,
  200: FontWeight.w200,
  300: FontWeight.w300,
  400: FontWeight.w300,
  500: FontWeight.w400,
  600: FontWeight.w500,
  700: FontWeight.w600,
  800: FontWeight.w700,
  900: FontWeight.w800,
};
