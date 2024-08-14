import 'package:auth_user/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextfield extends StatelessWidget {
  final String label;
  TextEditingController controller;
  bool isObsecure;

  CustomTextfield({
    required this.label,
    required this.controller,
    this.isObsecure = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        obscureText: isObsecure,
        style: GoogleFonts.poppins(fontSize: 13, color: Colors.black),
        decoration: InputDecoration(
          hintText: label,
          isDense: false,
          hintStyle: GoogleFonts.poppins(fontSize: 13, color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: borderColor, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: borderColor, width: 1),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        ));
  }
}
