// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../styles/colors/colores.dart';

class ImageDescription extends StatelessWidget {
  final String url, description;
  const ImageDescription(this.url, this.description);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color_Selector.c_gris,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4, right: 15),
              child: Image.asset(
                'assets/images/splash.png',
                color: Colors.white,
              ),
            )
          ],
        ),
        body: ListView(
          children: [
            Image.asset(url),
            Center(
              child: Text(description),
            )
          ],
        ));
  }
}
