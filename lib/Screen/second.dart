//registration page
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:majorproject/main.dart';
import '../third.dart';
import 'package:http/http.dart';
import '../service/api.dart';


void main() => runApp(const MyRegistration());

class MyRegistration extends StatelessWidget {
  const MyRegistration({Key? key}) : super(key: key);

  static const String _title = 'Registration Page';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(
                    builder: (context) => LoginPage())
                );
              },
              icon: const Icon(LineAwesomeIcons.angle_left)),
          title: const Text(_title,
          style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.blue[200],
        ),
        body: const MyStatefulWidget(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String _email = '';
  String _password = '';
  String _confirmPassword = '';
  String _name='';

  final storage = FlutterSecureStorage();

  registerPressed() async {
    if (_formKey.currentState!.validate()) {
      // print(nameController.text);
      // print(passwordController.text);

      Map data = {
        "email": _email,
        "password": _password,
        "confirmPassword":_confirmPassword,
        'name': _name,
      };
      Response response = await api.Post(
          "http://major.dns.army/api/register", jsonEncode(data));
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 201) {
        print(responseMap["token"]);
        await storage.write(key: 'token', value: responseMap["token"]);
        Navigator.push(
            context,
            MaterialPageRoute(builder:
                (context) => const MyTabBar()
            ));
      }
      else {
        const snackBar = SnackBar(
          content: Text('Invalid credential'),
        );
// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool rememberUser = false;

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  String? _nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? _confirmPasswordValidator(String? value) {
    if (value != _password) {
      return 'Passwords do not match';
    }
    return null;
  }
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Form( key: _formKey,
        child: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter email',
                ),
                  validator: _emailValidator,
                  onChanged: (value) {
                    _email = value;
                  }
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter name',
                ),
                  validator: _nameValidator,
                  onChanged: (value) {
                    _name = value;
                  }
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Password',
                ),
                  validator: _passwordValidator,
                  onChanged: (value) {
                    _password = value;
                  }
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Re-enter Password',
                ),
                  validator: _confirmPasswordValidator,
                  onChanged: (value) {
                    _confirmPassword = value;
                  }
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: ElevatedButton(
                  onPressed: registerPressed,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[200]),
                  child: const Text('Register'),
                )
            ),
          ],
        )));
  }
}