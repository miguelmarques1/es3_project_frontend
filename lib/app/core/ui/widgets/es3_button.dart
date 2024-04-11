import 'package:flutter/material.dart';

class ES3Button extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  const ES3Button(
      {super.key,
      required this.label,
      required this.onPressed,
      this.width,
      this.height = 50});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(onPressed: onPressed, child: Text(label)),
    );
  }
}
