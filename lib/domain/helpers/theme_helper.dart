import 'package:flutter/material.dart';

class ThemeHelper {
  static const Color PRIMARY_COLOR = Color.fromRGBO(34, 81, 163, 1);
  static const Color SECONDARY_COLOR = Color.fromRGBO(231, 76, 60, 1);
  static const Color BRASSERI_COLOR = Color.fromRGBO(255, 196,37, 1);
  static const Color UCB_COLOR = Color.fromRGBO(228, 49, 44, 1);
  static const Color LIGHT_COLOR = Colors.white;
  static const Color BLACL_COLOR = Colors.black;
  static const Color SUCCES_COLOR = Color.fromRGBO(3, 169, 245, 1);

  static TextStyle heading1({Color color = Colors.white}) {
    return TextStyle(fontWeight: FontWeight.bold, fontSize: 36, color: color);
  }

  static TextStyle heading2({Color color = Colors.white}) {
    return TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: color);
  }

  static TextStyle price({Color color = Colors.black}) {
    return TextStyle(fontWeight: FontWeight.normal, fontSize: 36, color: color);
  }

  static TextStyle paragraph({Color color = Colors.white, bool isBold: false,}) {
    return TextStyle(
        fontSize: 14,
        color: color,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal);
  }

  static TextStyle small({Color color = Colors.white, bool isBold: false}) {
    return TextStyle(
        fontSize: 10,
        color: color,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal);
  }


}
