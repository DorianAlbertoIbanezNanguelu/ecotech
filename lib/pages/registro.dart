// ignore_for_file: avoid_print, deprecated_member_use, library_private_types_in_public_api

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:passwordfield/passwordfield.dart';

import '../styles/colors/colores.dart';
import 'login_parte2.dart';

class Registro extends StatefulWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  _Registro createState() => _Registro();
}

class _Registro extends State<Registro> {
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
            const Text("Regístrate"),
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
                padding: const EdgeInsets.only(left: 30, top: 20, right: 30),
                width: double.infinity,
                child: const Text(
                  'Crea una cuenta para empezar a usar la app',
                  textAlign: TextAlign.left,
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
                  "Nombre",
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
                    labelText: 'Nombre',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 30, top: 7),
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
                    labelText: 'Dirección de correo',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 30, top: 7),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Contraseña",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30, top: 10, bottom: 10, right: 30),
                child: PasswordField(
                  color: Color_Selector.c_gris,
                  errorMessage: 'Contraseña Invalida',
                  inputDecoration: PasswordDecoration(),
                  passwordConstraint: r'[0-9a-zA-Z]{6}',
                  hintText: "Contraseña",
                  border: PasswordBorder(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 5, bottom: 5),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "La contraseña debe contener caracteres, números y símbolos con un minimo de 6 caracteres",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Color_Selector.c_grisTenue,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 30, top: 10, bottom: 10, right: 25),
                child: Row(
                  children: <Widget>[
                    RoundCheckBox(
                      size: 20,
                      onTap: (selected) {},
                      animationDuration: const Duration(
                        milliseconds: 500,
                      ),
                      checkedWidget: const Icon(
                        Icons.mood,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: RichText(
                          text: TextSpan(
                            text: 'Al registrarme, acepto los ',
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Términos y condiciones',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print(1);
                                  },
                                style: const TextStyle(
                                  color: Color_Selector.c_rosaFuerte,
                                ),
                              ),
                              const TextSpan(text: " y la "),
                              TextSpan(
                                text: 'Politica de privacidad',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print(2);
                                  },
                                style: const TextStyle(
                                  color: Color_Selector.c_rosaFuerte,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: RichText(
                    text: TextSpan(
                      text: '¿Ya tienes cuenta? ',
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Inicia Sesión',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Login_Parte2(),
                                ),
                              );
                            },
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color_Selector.c_rosaFuerte,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(bottom: 55),
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
                    child: Text("Crear Cuenta",
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
