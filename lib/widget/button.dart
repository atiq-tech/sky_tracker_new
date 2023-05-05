import 'package:flutter/material.dart';

class PurpleButton extends StatelessWidget {
  String? buttonName;
  Function()? onPressed;
  PurpleButton(this.buttonName, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height / 17,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 6, 175, 158),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
        ),
        child: Text(
          buttonName.toString(),
          style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 57, 2, 88)),
        ),
      ),
    );
  }
}
