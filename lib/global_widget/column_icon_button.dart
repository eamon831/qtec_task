import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ColumnIconButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final String iconPath;
  const ColumnIconButton({super.key, required this.text,this.onTap, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
     /// margin: const EdgeInsets.only(left: 10),
      padding: const EdgeInsets.fromLTRB(6, 12, 6, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFF7FAFC),
        border: Border.all(
          color: const Color(0xffE2E8F0)),

      ),
      child: Column(
        children: [


          SvgPicture.asset(iconPath),
          const SizedBox(height: 5,),

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
