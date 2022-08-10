import 'package:flutter/material.dart';

class BottomButtomIcon extends StatelessWidget {
  BottomButtomIcon(
      {required this.text,
      this.icon,
      required this.disabled,
      required this.onTap});

  final bool disabled;
  final VoidCallback onTap;
  final String text;
  final icon;

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
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(
                color: disabled == true ? Colors.black38 : Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
