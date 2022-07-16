// ignore_for_file: file_names, use_key_in_widget_constructors, camel_case_types, non_constant_identifier_names, library_private_types_in_public_api, use_build_context_synchronously

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../styles/colors/colores.dart';
import '../utils/authentication.dart';
import '../widgets/image_row.dart';
import '../widgets/slider_widget.dart';
import 'prueba2-firebase.dart';
import '../models/IoT_Info.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({Key? key, required User? user})
      : _user = user,
        super(key: key);

  final User? _user;

  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  late User _user;
  bool _isSigningOut = false;
  int pageIndex = 0;
  late Future<List<Data>> futureData,
      futureAgua,
      futureT_H,
      futureMotor,
      futureIntervalo;

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const prueba2_firebase(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    _user = widget._user!;
    super.initState();
    futureData = fetchData();
    futureT_H = fetchT_H();

    // defines a timer
    Timer.periodic(const Duration(seconds: 5), (Timer t) {
      setState(() {
        futureData = fetchData();
        futureT_H = fetchT_H();
      });
    });
  }

  final List<Widget> _pages = <Widget>[
    Container(),
    Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 40),
          child: Carousel(),
        ),
        Card(
          // Con esta propiedad modificamos la forma de nuestro card
          // Aqui utilizo RoundedRectangleBorder para proporcionarle esquinas circulares al Card
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

          // Con esta propiedad agregamos margen a nuestro Card
          // El margen es la separación entre widgets o entre los bordes del widget padre e hijo
          margin: const EdgeInsets.all(15),

          // Con esta propiedad agregamos elevación a nuestro card
          // La sombra que tiene el Card aumentará
          elevation: 10,

          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: circular_events(),
            ),
          ),
        ),
        const ImageRow()
      ],
    ),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color_Selector.c_naranja,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Bienvenido!"),
            Image.asset(
              'assets/images/splash.png',
              fit: BoxFit.contain,
              height: 50,
              color: Color_Selector.c_blanco,
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 8.0),
            _user.photoURL != null
                ? CircleAvatar(
                    minRadius: 60,
                    backgroundColor: Colors.transparent,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: Image.network(
                        _user.photoURL!,
                        scale: 0.75,
                      ),
                    ),
                  )
                : CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.asset('assets/images/firebase_logo.png'),
                    ),
                  ),
            const SizedBox(height: 8.0),
            Text(
              _user.displayName!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xffFFCA28),
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              '( ${_user.email!} )',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xffF57C00),
                fontSize: 20,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 16.0),
            _isSigningOut
                ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Color_Selector.c_amarillo),
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color_Selector.c_purpura,
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        setState(() {
                          _isSigningOut = true;
                        });
                        await Authentication.signOut(context: context);
                        setState(() {
                          _isSigningOut = false;
                        });
                        Navigator.of(context)
                            .pushReplacement(_routeToSignInScreen());
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Text(
                          'Cerrar Sesion',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
            const SizedBox(height: 8.0),
            Boton_CerrarVentana(),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              FutureBuilder<List<Data>>(
                future: futureT_H,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Data>? data = snapshot.data;
                    return Container(
                      height: (MediaQuery.of(context).size.height * 0.25),
                      width: (MediaQuery.of(context).size.width),
                      color: data![0].valor! >= 25
                          ? Color_Selector.e_estable
                          : Color_Selector.e_peligro,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  // By default show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Carta_1 extends Card {
  @override
  Widget build(BuildContext context) {
    return const Card(
      child: ListTile(
        leading: FlutterLogo(size: 56.0),
        title: Text('Comida No.1'),
        subtitle: Text('Opción1'),
        trailing: Icon(Icons.fastfood_rounded),
      ),
    );
  }
}

class Boton_CerrarVentana extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Color_Selector.c_rojo,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Padding(
          padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Text(
            'Cerrar Ventana',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 2,
            ),
          ),
        ),
      ),
    );
  }
}

List<Padding> circular_events() {
  List<Padding> circular_event = List<Padding>.generate(
    5,
    (index) => Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 80.0,
          height: 80.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/company.jpg'),
            ),
          ),
        ),
      ),
    ),
  );

  return circular_event;
}

List<Padding> image_events() {
  List<Padding> circular_event = List<Padding>.generate(
    3,
    (index) => Padding(
      padding: const EdgeInsets.only(left: 20, right: 25),
      child: InkWell(
        // No me deja manejar eventos
        onTap: () {},
        child: Container(
          width: 80,
          height: 100,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/firebase_logo.png',
              ),
            ),
          ),
        ),
      ),
    ),
  );

  return circular_event;
}
