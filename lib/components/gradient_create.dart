import 'package:flutter/material.dart';

class GradientCreate extends StatelessWidget {
  GradientCreate({required this.child});

  final Gradient _vilo_gradient = LinearGradient(
      colors: [Color(0xff09A9ED), Color(0xfffC55AE), Color(0xfff4435EC)]);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return _vilo_gradient.createShader(Offset.zero & bounds.size);
      },

      ///create the child color white to apply gradient
      child: child,
    );
  }
}
