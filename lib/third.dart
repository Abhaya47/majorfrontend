//home page
import 'package:flutter/material.dart';
import 'package:majorproject/addpage.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({Key? key}) : super(key: key);

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  int selectedIndex = 0;

  final widgetOptions = [
    // ChatFragment(),
    // StatusFragment(),
    // CallFragment(),

    Home(),
    Start(),
    Add(),
    Log()
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final widgetTitle = {"home", "start", "add", "log"};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: Text(
          "NutriCoach",
          style: TextStyle(fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
        ),
        actions: [
          // Person icon with dropdown menu
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle menu item selection
              // You can add logic based on the selected value
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return ["Information", "something"].map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
            icon: Icon(Icons.person),
          ),

          // Menu icon with dropdown menu
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle menu item selection
              // You can add logic based on the selected value
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return ["Settings", "Logout"].map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
            icon: Icon(Icons.menu),
          ),
        ],
      ),

          /*IconButton(
            onPressed: () {},
            icon: Icon(Icons.person),
          )
        ],
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
      ),*/
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        fixedColor: Colors.blue,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.house,
              ),
              label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.start), label: 'Start'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Log')
        ],
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  State<Start> createState() => _Start();
}

class _Start extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Start'),
      ),
    );
  }
}

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _Add();
}

class _Add extends State<Add> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Add'),
      ),
    );
  }
}

class Log extends StatefulWidget {
  const Log({Key? key}) : super(key: key);

  @override
  State<Log> createState() => _Log();
}

class _Log extends State<Log> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Log'),
      ),
    );
  }
}
