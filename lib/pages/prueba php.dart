// ignore_for_file: library_private_types_in_public_api, file_names, non_constant_identifier_names

import 'dart:async';
import 'package:ecotech/styles/colors/colores.dart';
import 'package:flutter/material.dart';

import '../models/IoT_Info.dart';

// ignore: camel_case_types, use_key_in_widget_constructors
class prueba_php extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Recibir JSON',
      home: Pagina(),
    );
  }
}

class Pagina extends StatefulWidget {
  const Pagina({Key? key}) : super(key: key);

  @override
  _PaginaState createState() => _PaginaState();
}

class _PaginaState extends State<Pagina> {
  late Future<List<Data>> futureData,
      futureAgua,
      futureT_H,
      futureMotor,
      futureIntervalo;

  Timer? timer;
  @override
  void initState() {
    super.initState();
    futureData = fetchData();

    // defines a timer
    Timer.periodic(const Duration(seconds: 5), (Timer t) {
      setState(() {
        futureData = fetchData();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Data>>(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Data>? data = snapshot.data;
              return CircleAvatar(
                backgroundColor: data![0].valor == "1"
                    ? Color_Selector.e_estable
                    : Color_Selector.e_peligro,
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
