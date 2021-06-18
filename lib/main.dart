import 'package:flutter/material.dart';
import './pages/login_page.dart';
import './pages/home_page.dart';
import 'pages/barcode_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
    routes: {
      '/login_page': (context) => LoginPage(),
      '/home_page': (context) => HomePage(),
      '/barcode_page': (context) => QrCode(),
    },
  ));
}
  