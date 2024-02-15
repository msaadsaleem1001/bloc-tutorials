
import 'package:flutter/material.dart';

class AppTextStyles {

  static TextStyle headerStyle({Color color = Colors.white, double fontSize = 30}){
    return TextStyle(
      color: color,
      fontWeight: FontWeight.bold,
      fontSize: fontSize
    );
  }

  static TextStyle emptyStyle({Color color = Colors.grey, double fontSize = 12}){
    return TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: fontSize
    );
  }

}