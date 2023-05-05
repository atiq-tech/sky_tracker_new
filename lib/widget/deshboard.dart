import 'package:flutter/material.dart';
import 'package:sktr/conts/app_colors.dart';
import 'gap_height.dart';

class DeshBoard extends StatelessWidget {
  DeshBoard({
    required this.title,
    required this.icon,
    required this.onTap,
    super.key,
  });

  IconData icon;
  String title;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Color.fromARGB(255, 114, 156, 190),
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColors.kPrimaryColor),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          height: 150.0,
          width: 150.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: Colors.teal),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 40.0,
                ),
                gapHeight(height: 5.0),
                Text(
                  title.toString(),
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
