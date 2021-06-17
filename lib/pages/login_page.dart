import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'dart:convert' as convert;

class LoginPage extends StatefulWidget {
  static String id = 'login_page';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Image(
                image: AssetImage('assets/images/logo-foot.png'),
                height: 100,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            _userTextField(),
            SizedBox(
              height: 15,
            ),
            _passTextField(),
            SizedBox(
              height: 15,
            ),
            _buttonLogin(),
          ],
        ),
      ),
    ));
  }

  Widget _userTextField() {
    return StreamBuilder(builder: (context, snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
        child: TextField(
          decoration: InputDecoration(
            icon: Icon(Icons.person),
            labelText: 'Usuario',
          ),
          keyboardType: TextInputType.text,
        ),
      );
    });
  }

  Widget _passTextField() {
    return StreamBuilder(builder: (context, snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
        child: TextField(
          decoration: InputDecoration(
            icon: Icon(Icons.password),
            labelText: 'Contraseña',
          ),
          keyboardType: TextInputType.visiblePassword,
        ),
      );
    });
  }

  Widget _buttonLogin() {
    return StreamBuilder(
      builder: (context, snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
          child: ElevatedButton(
            child: Text('Iniciar Sesión'),
            onPressed: () {
              login();
              Navigator.pushNamed(context, '/home_page');
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
            ),
          ),
        );
      },
    );
  }

  Future<http.Response> login() async {
    var url = Uri.parse('http://localhost/api.php');
    var res = await http.post(url, body: "'user':'manuel'");
    print(res.body);
    return res;
  }
}
