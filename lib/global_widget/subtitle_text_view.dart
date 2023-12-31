import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubtitleTextView extends StatelessWidget {
  final String text;
  const SubtitleTextView({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 13,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
