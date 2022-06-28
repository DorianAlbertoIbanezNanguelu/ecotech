import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'pages/login_parte1.dart';
import 'pages/prueba-firebase.dart';
import 'pages/prueba2-firebase.dart';
import 'widgets/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: 'initialFirebase2',
      routes: {
        'InitialPage': (BuildContext context) => const SplashView(),
        'InitialLoginCorte3': (BuildContext context) => const Login_parte1(),
        'initialFirebase': (BuildContext context) => const prueba_firebase(),
        'initialFirebase2': (BuildContext context) => const prueba2_firebase(),
      },
      // home: HomePage(),
    );
  }
}
