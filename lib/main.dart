// import 'package:flutter/material.dart';
// import 'Screen/start.dart';
// import 'package:majorproject/model/BottomNav/MyTabBar.dart';
//
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: 'welcome',
//       routes: {
//         'welcome': (context) => const MyTabBar(),
//       },
//       // title: 'NutriCoach',
//       // theme: ThemeData(
//       //   primarySwatch: Colors.grey,
//       // ),
//       // debugShowCheckedModeBanner: false,
//       // home: LoginPage(),
//     );
//   }
// }
// //
// // class LoginPage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             Image.asset('assets/image/logo.png'),
// //             SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: () {
// //               },
// //               child: Text('Login'),
// //             ),
// //             SizedBox(height: 10),
// //             ElevatedButton(
// //               onPressed: () {
// //               },
// //               child: Text('Sign Up'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
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
          print(snapshot.data);
      if(snapshot.hasData){
        return MaterialApp(title: "homepage", theme: ThemeData(primarySwatch: Colors.grey),
        home: MyTabBar()
        );
      }
      else{
        return MaterialApp(title: 'Login Page', theme: ThemeData(primarySwatch: Colors.grey,),
          home: LoginPage(),
        );

      }
    });
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
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}










