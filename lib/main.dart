import 'package:flutter/material.dart';
import './pages/01_reserva/lista_reservas_page.dart';
import './pages/01_reserva/nueva_reserva_page.dart';
import './pages/01_reserva/reserva_page.dart';
import './pages/02_despacho/despacho_page.dart';
import './pages/03_devolucion/devolucion_page.dart';
import './pages/04_tiempo_en_bodega/tiempo_en_bodega_page.dart';
import './pages/login_page.dart';
import './pages/home_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
    routes: {
      '/login_page': (context) => LoginPage(),
      '/home_page': (context) => HomePage(),
      '/reserva_page': (context) => ReservaPage(),
      '/nueva_reserva_page': (context) => NuevaReservaPage(),
      '/lista_reservas_page': (context) => ListaReservasPage(),
      '/despacho_page' : (context) => DespachoPage(),
      '/devolucion_page' : (context) => DevolucionPage(),
      '/tiempo_en_bodega_page' : (context) => TiempoEnBodegaPage(),
    },
  ));
}
