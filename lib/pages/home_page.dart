import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_buttonReserva(), _buttonDespacho(), _buttonSalir()],
        ),
      ),
    ));
  }

  Widget _buttonReserva() {
    return StreamBuilder(
      builder: (context, snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
          child: ElevatedButton(
            child: Text('Reserva'),
            onPressed: () {
              Navigator.pushNamed(context, '/barcode_page');
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
          ),
        );
      },
    );
  }

  Widget _buttonDespacho() {
    return StreamBuilder(
      builder: (context, snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
          child: ElevatedButton(
            child: Text('Despacho'),
            onPressed: () {
              Navigator.pushNamed(context, '/barcode_page');
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
          ),
        );
      },
    );
  }

  Widget _buttonSalir() {
    return StreamBuilder(
      builder: (context, snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
          child: ElevatedButton(
            child: Text('Salir'),
            onPressed: () {
              Navigator.pop(context);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
          ),
        );
      },
    );
  }
}
