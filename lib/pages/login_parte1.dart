import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../styles/colors/colores.dart';
import 'login_parte2.dart';
import 'registro.dart';

// ignore: camel_case_types
class Login_parte1 extends StatelessWidget {
  const Login_parte1({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Login(),
      ),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _MyStatefulWidgetState();
}

// ignore: camel_case_types
class _MyStatefulWidgetState extends State<Login> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          ListView(
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Container(
                    width: 200.0,
                    height: 200.0,
                    alignment: Alignment.center,
                    child: Image.asset(
                      "images/splash.png",
                      alignment: Alignment.center,
                      height: 150,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                  height: 48.0,
                  margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: SignInButton(
                    Buttons.GoogleDark,
                    text: "Continuar con Google",
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                  height: 48.0,
                  width: 300,
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: SignInButtonBuilder(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    backgroundColor: const Color(0xFF324fa5),
                    icon: Icons.facebook,
                    text: "Continuar con Facebook",
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                  height: 48.0,
                  width: 300,
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: SignInButtonBuilder(
                    icon: Icons.email,
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    iconColor: const Color(0xFF64686f),
                    text: "Registrarse con e-mail",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Registro(),
                        ),
                      );
                    },
                    backgroundColor: Color_Selector.c_blanco,
                    textColor: Color_Selector.c_negro,
                    splashColor: Color_Selector.c_grisTenue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 15),
                child: Container(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      text: 'Entrar como Invitado',
                      recognizer: TapGestureRecognizer()..onTap = () {},
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color_Selector.c_rosaFuerte,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      text: 'Entrar como vendedor',
                      recognizer: TapGestureRecognizer()..onTap = () {},
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color_Selector.c_verde,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(bottom: 10),
              child: RichText(
                text: TextSpan(
                  text: '¿Ya tienes cuenta? ',
                  style: const TextStyle(
                      fontSize: 13, color: Color_Selector.c_negro),
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
    );
  }
}
