// ignore_for_file: file_names
import 'dart:math';
import 'package:flutter/material.dart';

import '../styles/colors/colores.dart';

class ProgressCircle extends CustomPainter {
  double radioContainer;
  int progressColor;
  ProgressCircle(this.radioContainer, this.progressColor);
  Color algo = Color_Selector.c_verde;

  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    final paint1 = Paint()
      ..color = Color_Selector.c_blanco
      ..style = PaintingStyle.stroke;

    Offset offset = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(offset, radioContainer, paint1);

    switch (progressColor) {
      case 2:
        {
          algo = Color_Selector.c_rojo;
        }
        break;
      case 3:
        {
          algo = Color_Selector.c_rosaPastel;
        }
        break;
      case 4:
        {
          algo = Color_Selector.c_blanco;
        }
        break;
      case 5:
        {
          algo = Color_Selector.c_verdeClaroPastel;
        }
        break;
      case 6:
        {
          algo = Color_Selector.c_gris;
        }
        break;
    }

    final paint2 = Paint()
      ..strokeWidth = 8
      ..color = algo
      ..style = PaintingStyle.stroke;

    double porcentaje = pi * 2 * (radioContainer / 75);
    Rect rect = Rect.fromCircle(center: offset, radius: radioContainer);
    canvas.drawArc(rect, -pi / 2, porcentaje, false, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
