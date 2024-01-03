
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

InputDecoration globalInputDecoration = InputDecoration(
  hintText: 'hint',
  fillColor: Color(0xffffffff),
  filled: true,
  hintStyle: GoogleFonts.poppins(
    fontSize: 12,
    color: Color(0xff8e8e93),
    fontWeight: FontWeight.w500,
  ),

  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
    borderSide: const BorderSide(
      color: Color(0xffe3e8f0),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
    borderSide: const BorderSide(
      color: Color(0xffe3e8f0),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
    borderSide: const BorderSide(
      color: Color(0xffe3e8f0),
    ),
  ),
);