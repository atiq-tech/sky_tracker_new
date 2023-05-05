import 'package:flutter/material.dart';

class gapHeight extends StatelessWidget {
  gapHeight({required this.height, super.key});
  double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
