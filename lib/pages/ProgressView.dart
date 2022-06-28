// ignore_for_file: camel_case_types, file_names, non_constant_identifier_names, library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';

import '../styles/colors/colores.dart';
import '../widgets/ProgressPainter.dart';

class Corte_3 extends StatelessWidget {
  const Corte_3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Progress Bar',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _Corte_3 createState() => _Corte_3();
}

class _Corte_3 extends State<HomeScreen> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            controller.reverse();
          } else if (status == AnimationStatus.dismissed) {
            controller.forward();
          }
        },
      );
    controller.forward();

    Timer.periodic(
      const Duration(milliseconds: 1),
      (Timer timer) {
        if (!_isRunning) {
          timer.cancel();
        }
        _aumentarContador();
      },
    );
    super.initState();
  }

  final bool _isRunning = true;

  double contador = 1;
  int color_contador = 1;

  void _aumentarContador() {
    if (contador >= 75) {
      contador = 1;
      color_contador++;
    }
    if (color_contador > 6) {
      color_contador = 1;
    }

    contador = contador + 0.1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Progress Bar'),
      ),
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 200,
                  height: 200,
                  color: Color_Selector.c_negro,
                  child: CustomPaint(
                    painter: ProgressCircle(contador, color_contador),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
