import 'package:flutter/material.dart';
import 'Screen/home.dart';
import 'package:imlost/model/BottomNav/MyTabBar.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'welcome',
      routes: {
        'welcome': (context) => const MyTabBar(),
      },
      // title: 'NutriCoach',
      // theme: ThemeData(
      //   primarySwatch: Colors.grey,
      // ),
      // debugShowCheckedModeBanner: false,
      // home: LoginPage(),
    );
  }
}
//
// class LoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Image.asset('assets/image/logo.png'),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//               },
//               child: Text('Login'),
//             ),
//             SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () {
//               },
//               child: Text('Sign Up'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


