//login page
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:majorproject/main.dart';
import '../service/login.dart';
import 'second.dart';
import 'package:majorproject/addpage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// import '/model/BottomNav/MyTabBar.dart';
import 'package:majorproject/third.dart';
import 'package:http/http.dart';
import '../service/api.dart';

class MyLogin extends StatelessWidget {
  const MyLogin({Key? key}) : super(key: key);

  static const String _title = 'Login Page';

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

  final storage = new FlutterSecureStorage();
  loginPressed() async {
    if (_formKey.currentState!.validate()) {
      // print(nameController.text);
      // print(passwordController.text);

      Map data = {
        "email": _email,
        "password": _password
      };
      Response response = await api.Post(
          "http://major.dns.army/api/login", jsonEncode(data));
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
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

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(

        children: [
          Form(
            key: _formKey,
            child: Column(
              // padding: const EdgeInsets.all(10),
                children: [
                  const SizedBox(height: 12),

                  TextFormField(
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

                  const SizedBox(height: 12),

                  TextFormField(
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

                ]
            ),

          ),

          // TextButton(
          //   onPressed: () {
          //     //forgot password screen
          //   },
          //   child: const Text('Forgot Password',
          //     style: TextStyle(color: Colors.grey),
          //   ),
          // ),
          Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: ElevatedButton(
                child: const Text('Login'),
                onPressed: () => loginPressed(),
                // {
                //   if (_formKey.currentState!.validate()) {
                //     // print(nameController.text);
                //     // print(passwordController.text);
                //
                //     Navigator.push(context,
                //         MaterialPageRoute(builder: (context) => const MyTabBar()
                //         ));
                //   }
                // },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[200]),
              )
          ),
          Row(

            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              const Text('Don\'t\ have an account?'),
              TextButton(
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => const MyRegistration()
                      )
                  );
                }, //signup screen
              ),
            ],

          ),
        ],
      ),
    );
  }
}