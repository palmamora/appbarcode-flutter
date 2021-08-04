import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ListaReservasPage extends StatefulWidget {
  @override
  _ListaReservasPageState createState() => _ListaReservasPageState();
}

class _ListaReservasPageState extends State<ListaReservasPage> {
  List<Widget> _widgets = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Reservas'),
      ),
      body: ListView(
        children: _widgets,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _widgets = _refreshWidgets();

          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Future<List<String>> _getCodes() async {
    List<String> l = [];
    var url = Uri.parse('http://palma.6te.net/api.php');
    var res = await http.post(url,
        body: jsonEncode(<String, String>{
          'tipo': 'lista_reservas',
          'data': '',
        }));
    print(res.statusCode);
    Map<dynamic, dynamic> reqCodes = stringToMap(res.body);
    reqCodes.forEach((key, value) {
      l.add(value);
    });
    print(l);
    return l;
  }

  Map<dynamic, dynamic> stringToMap(String s) {
    Map<dynamic, dynamic> map = json.decode(s);
    return map;
  }

  List<Widget> _refreshWidgets() {
    List<Widget> l = [];
    _getCodes().then((List<String> list) {
      for (var i = 0; i < list.length; i++) {
        l
          ..add(ListTile(
            title: Text(list[i]),
          ))
          ..add(Divider());
      }
      return l;
    });
    return l;
  }
}
