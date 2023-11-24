import 'package:flutter/material.dart';

class ColorsButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color? color;

  const ColorsButton(
      {super.key, required this.text, required this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shadowColor: Color(0xFFFFFF),
            backgroundColor: color ?? Colors.grey,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
          ),
          child: Text(
            text,
            textAlign: TextAlign.justify,
          )),
    );
  }
}
