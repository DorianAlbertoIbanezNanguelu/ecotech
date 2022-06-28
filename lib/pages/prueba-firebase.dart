// ignore_for_file: camel_case_types, deprecated_member_use, file_names, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/loginForm-firebase.dart';
import '../widgets/registerForm-firebase.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class prueba_firebase extends StatelessWidget {
  const prueba_firebase({Key? key}) : super(key: key);

  static const String _title = 'Flutter Firebase';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: firebase_login_Login(),
      ),
    );
  }
}

class firebase_login_Login extends StatefulWidget {
  const firebase_login_Login({Key? key}) : super(key: key);

  @override
  State<firebase_login_Login> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<firebase_login_Login> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        actions: <Widget>[
          Builder(builder: (BuildContext context) {
//5
            return FlatButton(
              textColor: Theme.of(context).buttonColor,
              onPressed: () async {
                User? user = FirebaseAuth.instance.currentUser;
                if (user == null) {
//6
                  Scaffold.of(context).showSnackBar(const SnackBar(
                    content: Text('No one has signed in.'),
                  ));
                  return;
                }
                await _auth.signOut();
                final String? uid = user.email;
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('${uid!} has successfully signed out.'),
                ));
              },
              child: const Text('Sign out'),
            );
          })
        ],
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            children: [
              RegisterEmailSection(),
              EmailPasswordForm(),
            ],
          )
        ],
      ),
    );
  }
}
