// ignore_for_file: camel_case_types, deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../styles/colors/colores.dart';
import '../utils/authentication.dart';
import '../widgets/google-sign-in.dart';
import 'prueba-firebase.dart';

class prueba2_firebase extends StatelessWidget {
  const prueba2_firebase({Key? key}) : super(key: key);

  static const String _title = 'Eco-Tech Irrigation';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _prueba2_firebase(),
      ),
    );
  }
}

class _prueba2_firebase extends StatefulWidget {
  const _prueba2_firebase({Key? key}) : super(key: key);

  @override
  State<_prueba2_firebase> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<_prueba2_firebase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color_Selector.p_celeste,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Iniciar sesión"),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Image.asset(
                        'assets/images/ecotech-icon.png',
                        height: 160,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'ECO-TECH',
                      style: TextStyle(
                        color: Color_Selector.p_verde,
                        fontSize: 40,
                      ),
                    ),
                    const Text(
                      'Bienvenido, favor de iniciar sesión',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color_Selector.p_verdeLima,
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                future: Authentication.initializeFirebase(context: context),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Error initializing Firebase');
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return const GoogleSignInButton();
                  }
                  return const CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color_Selector.e_cuidado),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
