import 'dart:convert';

import 'package:ecotech/styles/colors/colores.dart';
import 'package:requests/requests.dart';
import 'package:flutter/material.dart';

import 'calendar.dart';

class fechaHistorial {
  final DateTime? fecha;
  final int? id, valor;

  fechaHistorial({
    this.id,
    this.valor,
    this.fecha,
  });

  factory fechaHistorial.fromJson(
    Map<String, dynamic> json,
  ) {
    return fechaHistorial(
      id: int.parse(json['id']),
      fecha: json['fecha'],
      valor: int.parse(json['estadoAgua']),
    );
  }
}

Future<List<Meeting>> sfHistorial() async {
  var data = await Requests.get(
      "https://ecotech-up.000webhostapp.com/prueba/getFecha.php");
  var jsonData = json.decode(data.body);

  final List<Meeting> appointmentData = [];
  for (var data in jsonData) {
    late Color dataColor;
    
    DateTime fechaInicio = DateTime.parse(data['fecha']);

    DateTime endTime = fechaInicio.add(const Duration(minutes: 30));

    int agua = int.parse(data['estadoAgua']);

    if (agua >= 90) {
      dataColor = Color_Selector.e_optimo;
    } else if (agua >= 70 && agua < 90) {
      dataColor = Color_Selector.e_revision;
    } else if (agua >= 50 && agua < 70) {
      dataColor = Color_Selector.e_cuidado;
    } else if (agua >= 30 && agua < 50) {
      dataColor = Color_Selector.e_advertencia;
    } else if (agua <= 29) {
      dataColor = Color_Selector.e_peligro;
    }

    Meeting meetingData = Meeting(
      "Riego 10 mins",
      fechaInicio,
      endTime,
      dataColor,
      false,
    );
    appointmentData.add(meetingData);
  }
  return appointmentData;
}
