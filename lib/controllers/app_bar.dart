import 'package:elbrit_central/views/profile.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class NewAppBar extends StatelessWidget {
  const NewAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(6),
              //   color: const Color(0xffFFFFFF),
              // ),
              // height: 200,
              // width: 200,
              // child: Image.asset(
              //   'images/logo.png',
              //   scale: 1.2,
              // )
          ),
        ),
      ),
      GestureDetector(
        child: Stack(
          children: [
            Container(
              height: 50,
              width: 50,
              child: Image.asset(
                'images/Vector-5.png',
                scale: 1.2,
              ),
            ),
            Positioned(
                left: 18,
                top: 15,
                child: Image.asset(
                  'images/Vector-6.png',
                  scale: 1,
                )),
          ],
        ),
        onTap: () {
          //var _Controller;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfilePage(
                  // _Controller.text,
                  ),
            ),
          );
        },
      ),
    ]);
  }
}
