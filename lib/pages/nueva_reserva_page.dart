import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart' as http;

class NuevaReservaPage extends StatefulWidget {
  @override
  _NuevaReservaPageState createState() => _NuevaReservaPageState();
}

class _NuevaReservaPageState extends State<NuevaReservaPage> {
  static ButtonStyle _estiloBoton = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.green),
      minimumSize: MaterialStateProperty.all(Size(150, 50)));
  final _textController = TextEditingController();
  List<String> _codes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nueva Reserva')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                  labelText: 'Código de Barras:', icon: Icon(Icons.bar_chart)),
              keyboardType: TextInputType.number,
              controller: _textController,
            ),
          ),
          ElevatedButton(
              child: Text('Añadir', textScaleFactor: 1.25),
              onPressed: () {
                String val = _textController.text.toString();
                _textController.text = '';
                _addCodeToList(val: val);
                setState(() {});
              },
              style: _estiloBoton),
          SizedBox(
            height: 200,
            child: Card(
              child: ListView(
                children: _generateList(),
              ),
            ),
          ),
          ElevatedButton(
              child: Text('Enviar', textScaleFactor: 1.25),
              onPressed: () {
                setState(() {
                  _sendCodes(_codes);
                  _cleanFields();
                });
              },
              style: _estiloBoton),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _scanBarCode,
        child: const Icon(Icons.camera_alt),
      ),
    );
  }

  List<Widget> _generateList() {
    List<Widget> list = [];
    for (String code in _codes) {
      list
        ..add(ListTile(
          title: Text(code),
          onLongPress: _removeCodeToList,
        ))
        ..add(Divider());
    }
    return list;
  }

  void _addCodeToList({val}) {
    _codes.add(val);
  }

  void _removeCodeToList({val}) {
    _codes.remove(val);
  }

  void _scanBarCode() async {
    await FlutterBarcodeScanner.scanBarcode(
            "#000000", "Cancelar", true, ScanMode.BARCODE)
        .then((val) => setState(() => _textController.text = val));
  }

  void _sendCodes(List<String> codes) async {
    var url = Uri.parse('http://127.0.0.1/api.php');
    var res = await http.post(url,
        body: jsonEncode(<String, String>{
          'tipo': 'nueva reserva despacho',
          'data': codes.join(','),
        }));
    print(res.statusCode);
    print(res.body);
  }

  void _cleanFields() {
    _codes.clear();
  }

  Future<void> _showDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Éxito'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Icon(Icons.ac_unit),
                  Text('Se han reservado exitosamente.')
                ],
              ),
            ),
          ).;
        });
  }
}
