// ignore_for_file: file_names, avoid_init_to_null

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';

import '../styles/colors/colores.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

// ignore: use_key_in_widget_constructors
class EmailPasswordForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EmailPasswordFormState();
}

class _EmailPasswordFormState extends State<EmailPasswordForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool? _success = null;

  late String _userEmail;

  void _signInWithEmailAndPassword() async {
    final User? user = (await _auth.signInWithEmailAndPassword(
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
        _success = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(40),
            alignment: Alignment.center,
            child: const Text('Test sign in with email and password'),
          ),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
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
            // ignore: deprecated_member_use
            child: RaisedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _signInWithEmailAndPassword();
                }
              },
              child: const Text('Submit'),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              _success == null
                  ? ''
                  : (_success ?? true
                      ? 'Successfully signed in $_userEmail'
                      : 'Sign in failed'),
              style: const TextStyle(color: Color_Selector.c_rojo),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
