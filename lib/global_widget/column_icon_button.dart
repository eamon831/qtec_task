import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColumnIconButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onTap;
  const ColumnIconButton({super.key, required this.text, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
     /// margin: const EdgeInsets.only(left: 10),
      padding: const EdgeInsets.fromLTRB(6, 12, 6, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFFF7FAFC),
        border: Border.all(
          color: Color(0xffE2E8F0)),

      ),
      child: Column(
        children: [
          Icon(
              icon,
              color: Color(0xff718096),
              size: 24,),

          Text(text,style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: Color(0xff718096),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),

          ),),

        ],
      ),
    );
  }
}
