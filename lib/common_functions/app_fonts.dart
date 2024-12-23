import 'package:flutter/material.dart';
class AppFont {
  static elevatedButtonStyle({Color? color, Color? borderColor}) {
    return ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: borderColor ?? Colors.transparent), // Add border color
      ),
      backgroundColor: color ?? const Color(0xff0B4A6F),
    );
  }
}

