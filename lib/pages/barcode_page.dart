import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart' as http;

class QrCode extends StatefulWidget {
  @override
  _QrCodeState createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  String _data = "0";
  String _tipo = "reserva";

  _scan() async {
    await FlutterBarcodeScanner.scanBarcode(
            "#000000", "Cancelar", true, ScanMode.BARCODE)
        .then((value) => setState(() => _data = value));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('BarCodeApp'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DropdownButton(
              value: _tipo,
              items: [
                DropdownMenuItem(
                  child: Text("Reserva"),
                  value: "reserva",
                ),
                DropdownMenuItem(
                  child: Text("Despacho"),
                  value: "despacho",
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _tipo = value.toString();
                });
              }),
            ElevatedButton(
              child: Text("Escanear Código de Barras"),
              onPressed: () => _scan(),
            ),
            Text(_data),
            _buttonEnviar(),
            _buttonVolver(),
          ],
        ),
      ),
    );
  }

  Widget _buttonEnviar() {
    return StreamBuilder(
      builder: (context, snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
          child: ElevatedButton(
            child: Text('Enviar'),
            onPressed: () {
              enviar(_data, _tipo);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
            ),
          ),
        );
      },
    );
  }

  Widget _buttonVolver() {
    return StreamBuilder(
      builder: (context, snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
          child: ElevatedButton(
            child: Text('Volver'),
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

  Future<http.Response> enviar(String _data, String _tipo) async {
    var url = Uri.parse('http://localhost/api.php');
    var res = await http.post(url,
        body: jsonEncode(<String, String>{
          'tipo': _tipo,
          'code': _data,
        }));
    print(res.statusCode);
    print(res.body);
    return res;
  }
}
