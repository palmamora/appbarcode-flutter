import 'package:flutter/material.dart';

class ListaReservasPage extends StatefulWidget {
  @override
  _ListaReservasPageState createState() => _ListaReservasPageState();
}

class _ListaReservasPageState extends State<ListaReservasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista Reservas'),),
      body: ListView(
        children: [
          ListTile(title: Text('344143414'),),
          Divider(),
          ListTile(title: Text('344000654'),),
          Divider(),
          ListTile(title: Text('098953414'),),
          Divider(),
        ],
      ),
    );
  }
}