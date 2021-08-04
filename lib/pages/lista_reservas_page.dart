import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ListaReservasPage extends StatefulWidget {
  @override
  _ListaReservasPageState createState() => _ListaReservasPageState();
}

class _ListaReservasPageState extends State<ListaReservasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Reservas'),
      ),
      body: FutureBuilder<List<String>>(
        future: _getCodes(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Text(
                  '\n   Cargando...',
                  style: TextStyle(color: Colors.red),
                )
              ],
            ));
          } else {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(snapshot.data![index]),
                  );
                });
          }
        },
      ),
    );
  }

  Future<List<String>> _getCodes() async {
    List<String> lst = [];
    var url = Uri.parse('http://palma.6te.net/api.php');
    var res = await http.post(url,
        body: jsonEncode(<String, String>{
          'tipo': 'lista_reservas',
          'data': '',
        }));
    Map<dynamic, dynamic> reqCodes = stringToMap(res.body);
    reqCodes.forEach((k, v) {
      lst.add(v.toString());
    });
    return lst;
  }

  Map<dynamic, dynamic> stringToMap(String s) {
    Map<dynamic, dynamic> map = json.decode(s);
    return map;
  }
}
