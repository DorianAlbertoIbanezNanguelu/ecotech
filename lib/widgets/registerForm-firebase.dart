// ignore_for_file: file_names, avoid_init_to_null, deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';

import '../styles/colors/colores.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

// ignore: use_key_in_widget_constructors
class RegisterEmailSection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterEmailSectionState();
}

class _RegisterEmailSectionState extends State<RegisterEmailSection> {
  bool isChecked = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool? _success = null;

  late String _userEmail;

  void _register() async {
    final User? user = (await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email!;
      });
    } else {
      setState(() {
        _success = true;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(left: 30, top: 10, bottom: 10, right: 30),
            child: TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                labelText: 'Email Address',
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 30, top: 10, bottom: 10, right: 30),
            child: PasswordField(
              controller: _passwordController,
              color: Color_Selector.c_gris,
              errorMessage:
                  'La contraseña debe contener caracteres, números y símbolos con un minimo de 6 caracteres',
              passwordConstraint: r'[0-9a-zA-Z]{6}',
              inputDecoration: PasswordDecoration(),
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
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            alignment: Alignment.center,
            child: RaisedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _register();
                }
              },
              child: const Text('Crear'),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(_success == null
                ? ''
                : (_success ?? true
                    ? 'Creado exitosamente $_userEmail'
                    : 'Ha ocurrido un error inesperado.')),
          )
        ],
      ),
    );
  }
}
