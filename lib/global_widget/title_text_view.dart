import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleTextView extends StatelessWidget {
  final String text;
  const TitleTextView({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.hindSiliguri(
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),

      ),
    );
  }
}
