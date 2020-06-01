

import 'package:flutter/material.dart';

const icon = 'assets/images/bmi.svg';

const double baseHeight = 650.0;

double screenAwareSize(double size, BuildContext context) {
  return size * MediaQuery.of(context).size.shortestSide / baseHeight;
}

mainColor() => Color(0xFF4E5A86);
