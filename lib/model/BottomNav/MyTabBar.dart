import 'package:flutter/material.dart';
import 'Btm1.dart';
import 'Btm2.dart';
import 'Btm3.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({Key? key}) : super(key: key);

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  int selectedIndex=0;

  final widgetOptions=[
    ChatFragement(),
    StatusFragment(),
    CallFragment(),
  ];

  void onItemTapped(int index){
    setState(() {
      selectedIndex=index;
    });
  }
  final widgetTitle={"home","start","log"};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      appBar: AppBar(
        centerTitle: true,

        backgroundColor: Colors.grey,
          title: Text("NutriCoach", style: TextStyle(fontStyle: FontStyle.italic),textAlign: TextAlign.center, ),

          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.person),)],

        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_vert),
        ),
    ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        fixedColor: Colors.red,

        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(
            Icons.house,
          ), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(
              Icons.start
          ), label: 'Start'),
          BottomNavigationBarItem(icon: Icon(
              Icons.book
          ), label: 'Log')
        ],
      ),
    );
  }
}
