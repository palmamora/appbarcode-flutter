import 'package:appbarcode/pages/lista_reservas_page.dart';
import 'package:appbarcode/pages/nueva_reserva_page.dart';
import 'package:flutter/material.dart';
import './pages/login_page.dart';
import './pages/home_page.dart';
import 'pages/barcode_page.dart';
import './pages/reserva_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
    routes: {
      '/login_page': (context) => LoginPage(),
      '/home_page': (context) => HomePage(),
      '/barcode_page': (context) => QrCode(),
      '/reserva_page': (context) => ReservaPage(),
      '/nueva_reserva_page': (context) => NuevaReservaPage(),
      '/lista_reservas_page': (context) => ListaReservasPage(),
    },
  ));
}
