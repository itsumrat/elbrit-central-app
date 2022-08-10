import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton(
      {required this.text, required this.disabled, required this.onTap});

  final bool disabled;
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: disabled == true
                ? const Color(0xffF5F8FF)
                : const Color(0xff0DA7ED)),
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        padding: const EdgeInsets.only(top: 13, bottom: 13),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: disabled == true ? Colors.black38 : Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
