// import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:get/get_core/src/get_main.dart';
// // import 'package:majorproject/Profile/profile.dart';
// import 'package:majorproject/Screen/second.dart';
//
//
// // import 'Btm1.dart';
// // import 'Btm2.dart';
// // import 'Btm3.dart';
// // hellloooooo
// class MyTabBar extends StatefulWidget {
//   const MyTabBar({Key? key}) : super(key: key);
//
//   @override
//   State<MyTabBar> createState() => _MyTabBarState();
// }
//
// class _MyTabBarState extends State<MyTabBar> {
//   int selectedIndex=0;
//
//   final widgetOptions=[
//     // ChatFragement(),
//     // StatusFragment(),
//     // CallFragment(),
//
//     Home(),
//     Start(),
//     Log()
//   ];
//
//   void onItemTapped(int index){
//     setState(() {
//       selectedIndex=index;
//     });
//   }
//   final widgetTitle={"home","start","log"};
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: widgetOptions.elementAt(selectedIndex),
//       ),
//       appBar: AppBar(
//         centerTitle: true,
//
//         backgroundColor: Colors.grey,
//           title: const Text("NutriCoach", style: TextStyle(fontStyle: FontStyle.italic),textAlign: TextAlign.center, ),
//
//           actions: [
//             IconButton(
//               // onPressed: () => Get.to(() => const ProfileScreen()),
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const ProfileScreen())
//                 );
//                 },
//               icon: Icon(Icons.person))],
//
//
//         leading: IconButton(
//           onPressed: () {},
//           icon: Icon(Icons.more_vert),
//         ),
//     ),
//
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: selectedIndex,
//         onTap: onItemTapped,
//         fixedColor: Colors.red,
//
//         items: const <BottomNavigationBarItem>[
//
//           BottomNavigationBarItem(icon: Icon(
//             Icons.house,
//           ), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(
//               Icons.start
//           ), label: 'Start'),
//           BottomNavigationBarItem(icon: Icon(
//               Icons.book
//           ), label: 'Log')
//         ],
//       ),
//     );
//   }
//
//
// }
//
//
// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   State<Home> createState() => _Home();
// }
//
// class _Home extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text('Home'),
//       ),
//     );
//   }
// }
//
// class Start extends StatefulWidget {
//   const Start({Key? key}) : super(key: key);
//
//   @override
//   State<Start> createState() => _Start();
// }
//
// class _Start extends State<Start> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text('Start'),
//       ),
//     );
//   }
// }
//
// class Log extends StatefulWidget {
//   const Log({Key? key}) : super(key: key);
//
//   @override
//   State<Log> createState() => _Log();
// }
//
// class _Log extends State<Log> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text('Log'),
//       ),
//     );
//   }
