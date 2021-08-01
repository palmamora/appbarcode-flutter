import 'package:flutter/material.dart';

class ReservaPage extends StatefulWidget {
  static String id = 'reserva_page';

  @override
  _ReservaPageState createState() => _ReservaPageState();
}

class _ReservaPageState extends State<ReservaPage> {
  static ButtonStyle _estiloBoton = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.black),
      minimumSize: MaterialStateProperty.all(Size(240, 80)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reserva'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ElevatedButton(
                  child: Text('Nueva Reserva', textScaleFactor: 1.75),
                  onPressed: () {
                    Navigator.pushNamed(context, '/nueva_reserva_page');
                  },
                  style: _estiloBoton),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ElevatedButton(
                  child: Text('Lista Reservas', textScaleFactor: 1.75),
                  onPressed: () {
                    Navigator.pushNamed(context, '/lista_reservas_page');
                  },
                  style: _estiloBoton),
            ),
          ],
        ),
      ),
    );
  }
}
