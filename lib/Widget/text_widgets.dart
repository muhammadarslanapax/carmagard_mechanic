import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  const SmallText({super.key, required this.data});
  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(
          color: Color(0xff7a7878), fontSize: 14, fontWeight: FontWeight.w400),
    );
  }
}

class NormalText extends StatelessWidget {
  const NormalText(
      {super.key,
      required this.text,
      this.color,
      this.fontSize,
      this.fontWeight});
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
