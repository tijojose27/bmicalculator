

import 'package:flutter/material.dart';

const icon = 'assets/images/bmi.svg';

const double baseHeight = 650.0;

double screenAwareSize(double size, BuildContext context) {
  return size * MediaQuery.of(context).size.shortestSide / baseHeight;
}

mainColor() => Color(0xFF4E5A86);
subColor() => Color(0xFF4E5A86).withOpacity(0.5);


bool isNumeric(String s) {
  if(s == null) {
    return false;
  }
  return s is int;
}

Map<String, int> gender = {
  "male":  1,
  "female" : 2,
  "unknown" : 0
};