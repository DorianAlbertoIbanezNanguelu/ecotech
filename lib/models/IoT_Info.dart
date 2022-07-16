// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:requests/requests.dart';

class Data {
  final String? id, valor, dispositivo;

  Data({
    this.id,
    this.valor,
    this.dispositivo,
  });

  factory Data.fromJson(
    Map<String, dynamic> json,
  ) {
    return Data(
      id: json['id'],
      dispositivo: json['dispositivo'],
      valor: json['valor'],
    );
  }
}

Future<List<Data>> fetchData() async {
  final response = await Requests.get(
    'https://ecotech-up.000webhostapp.com/prueba/getLedStatus.php',
  );
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(
      response.body,
    );
    return jsonResponse.map((data) => Data.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

Future<List<Data>> fetchAgua() async {
  final response = await Requests.get(
    'https://ecotech-up.000webhostapp.com/prueba/getAgua.php',
  );
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(
      response.body,
    );
    return jsonResponse.map((data) => Data.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

Future<List<Data>> fetchIntervalo() async {
  final response = await Requests.get(
    'https://ecotech-up.000webhostapp.com/prueba/getIntervalo.php',
  );
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(
      response.body,
    );
    return jsonResponse.map((data) => Data.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

Future<List<Data>> fetchT_H() async {
  final response = await Requests.get(
    'https://ecotech-up.000webhostapp.com/prueba/getT_H.php',
  );
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(
      response.body,
    );
    return jsonResponse.map((data) => Data.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

Future<List<Data>> fetchMotor() async {
  final response = await Requests.get(
    'https://ecotech-up.000webhostapp.com/prueba/getMotor.php',
  );
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(
      response.body,
    );
    return jsonResponse.map((data) => Data.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}
