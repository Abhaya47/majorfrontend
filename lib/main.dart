import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:majorproject/Screen/first.dart';
import 'package:majorproject/Screen/second.dart';
import 'package:majorproject/addpage.dart';
import 'package:majorproject/third.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storage = FlutterSecureStorage();
    return FutureBuilder(
        future: storage.read(key: 'token'),
        builder: (BuildContext context,
        AsyncSnapshot<String?> snapshot){
      if(snapshot.hasData){
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "homepage", theme: ThemeData(primarySwatch: Colors.grey),
        home: MyTabBar()
        );

      }
      else{
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Login Page',
          theme: ThemeData(primarySwatch: Colors.grey,),
          home: LoginPage(),
        );

      }}
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/image/logo.png'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyLogin()),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[200]),
              child: Text('Login'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyRegistration()),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[200]),
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );

  }
}










