
import 'package:flutter/animation.dart';

class FastCurve extends Curve {
  const FastCurve();

  // t = x
  @override
  double transformInternal(double t) {
    double val = 0.9 + t * 0.1;
    return
    val; //f(x)
  }
}