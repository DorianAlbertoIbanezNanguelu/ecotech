// ignore_for_file: camel_case_types, deprecated_member_use, library_private_types_in_public_api

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:passwordfield/passwordfield.dart';

import '../styles/colors/colores.dart';
import 'contraseña.dart';
import 'registro.dart';

class Login_Parte2 extends StatefulWidget {
  const Login_Parte2({Key? key}) : super(key: key);

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login_Parte2> {
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
            const Text("Iniciar sesión"),
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
                padding: const EdgeInsets.only(
                  left: 30,
                  top: 20,
                ),
                width: double.infinity,
                child: const Text(
                  'Inicia Sesión con tu cuenta para continuar',
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
                    labelText: 'Email Address',
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
                  errorMessage:
                      'La contraseña debe contener caracteres, números y símbolos con un minimo de 6 caracteres',
                  passwordConstraint: r'[0-9a-zA-Z]{6}',
                  inputDecoration: PasswordDecoration(),
                  hintText: "Password",
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
                alignment: Alignment.centerRight,
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: '¿Has olvidado tu contraseña?',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Password(),
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: RichText(
                    text: TextSpan(
                      text: '¿Todavia no tienes cuenta? ',
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Registrate',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Registro(),
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
                    child: Text("Ingresar",
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
