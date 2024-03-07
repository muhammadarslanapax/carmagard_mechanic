import 'package:flutter/material.dart';

SnackBar customSnackBar(String message, {Color color = Colors.grey}) =>
    SnackBar(
      backgroundColor: color,
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.white),
      ),
    );
