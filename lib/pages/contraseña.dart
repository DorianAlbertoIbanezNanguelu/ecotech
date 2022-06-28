// ignore_for_file: camel_case_types, deprecated_member_use, file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../styles/colors/colores.dart';

class Password extends StatefulWidget {
  const Password({Key? key}) : super(key: key);

  @override
  _Password createState() => _Password();
}

class _Password extends State<Password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color_Selector.c_purpura,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color_Selector.c_rosaFuerte,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Recuperar Contraseña"),
            Image.asset(
              'images/splash.png',
              fit: BoxFit.contain,
              height: 50,
              color: Color_Selector.c_blanco,
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(left: 30, top: 20, right: 5),
                width: double.infinity,
                child: const Text(
                  'Ingresa tu email para restablecer tu contraseña',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color_Selector.c_gris,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 30, top: 30),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Correo electrónico",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(left: 30, top: 10, bottom: 10, right: 30),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                    labelText: 'Direccion de correo',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 45, right: 30, top: 5, bottom: 5),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Ingrese su correo electrónico registrado y le enviaremos un correo electrónico que contiene un enlace para restablecer su contraseña",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 13.5,
                    color: Color_Selector.c_grisTenue,
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                height: 48.0,
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: FlatButton(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  color: Color_Selector.c_verde,
                  textColor: Color_Selector.c_blanco,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  onPressed: () {
                    /*...*/
                  },
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text("Enviar Solicitud",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
