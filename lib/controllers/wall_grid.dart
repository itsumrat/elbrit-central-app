import 'package:flutter/material.dart';

class WallGridPage extends StatelessWidget {
  const WallGridPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Image.asset('images/img_2.png', fit: BoxFit.fill),
      ),
    );
  }
}
