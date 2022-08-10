import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextTile extends StatelessWidget {
  final String title;
  const TextTile({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.dmSans(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: const Color(0xff191919)),
    );
  }
}
