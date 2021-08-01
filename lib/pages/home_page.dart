import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static ButtonStyle _estiloBoton = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.black),
      minimumSize: MaterialStateProperty.all(Size(240, 80)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ElevatedButton(
                  child: Text('Reserva', textScaleFactor: 1.75),
                  onPressed: () {
                    Navigator.pushNamed(context, '/reserva_page');
                  },
                  style: _estiloBoton),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ElevatedButton(
                  child: Text('Despacho', textScaleFactor: 1.75),
                  onPressed: () {
                    Navigator.pushNamed(context, '/reserva_page');
                  },
                  style: _estiloBoton),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ElevatedButton(
                  child: Text('Devolución', textScaleFactor: 1.75),
                  onPressed: () {
                    Navigator.pushNamed(context, '/reserva_page');
                  },
                  style: _estiloBoton),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ElevatedButton(
                  child: Text('Tiempo en Bodega', textScaleFactor: 1.75),
                  onPressed: () {
                    Navigator.pushNamed(context, '/reserva_page');
                  },
                  style: _estiloBoton),
            ),
            _buttonSalir(),
          ],
        ),
      ),
    );
  }

  Widget _button(String titulo) {
    return StreamBuilder(
      builder: (context, snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ElevatedButton(
            child: Text(
              titulo,
              textScaleFactor: 1.75,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/reserva_page');
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black),
              minimumSize: MaterialStateProperty.all(Size(240, 80)),
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
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ElevatedButton(
            child: Text(
              'Salir',
              textScaleFactor: 1.75,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
              minimumSize: MaterialStateProperty.all(Size(150, 50)),
            ),
          ),
        );
      },
    );
  }
}
