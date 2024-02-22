//home page
import 'package:flutter/material.dart';
import 'package:majorproject/Profile/profile.dart';
import 'package:majorproject/addpage.dart';
import 'package:majorproject/main.dart';
import 'model/BottomNav/log.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({Key? key}) : super(key: key);

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  int selectedIndex = 0;

  final widgetOptions = [
    Home(),
    Start(),
    AddPage(),
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
        backgroundColor: Colors.blue[200],
        automaticallyImplyLeading: false,
        title: const Text(
          "NutriCoach",
          style: TextStyle(fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen())
          );
          },
            icon: Icon(Icons.person),
          ),

          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage())
            );
          },
            icon: Icon(Icons.logout),
          ),

          // Menu icon with dropdown menu
          // PopupMenuButton<String>(
          //   onSelected: (value) {
          //     // Handle menu item selection
          //     // You can add logic based on the selected value
          //     print(value);
          //   },
          //   itemBuilder: (BuildContext context) {
          //     return ["Logout"].map((String choice) {
          //       return PopupMenuItem<String>(
          //         value: choice,
          //         child: Text(choice),
          //       );
          //     }).toList();
          //   },
          //   icon: Icon(Icons.menu),
          // ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        fixedColor: Colors.blue[200],
        unselectedItemColor: Colors.blue[200],
        items: const <BottomNavigationBarItem>[
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
        // children: [
        //   AppBar(
        //     centerTitle: true,
        //     backgroundColor: Colors.grey,
        //     title: Text("NutriCoach",
        //     style: TextStyle(fontStyle: FontStyle.italic),
        //     textAlign: TextAlign.center,
        //     ),
        //   )
        // ],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300.0,
              height: 300.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey,
              ),
            child: Image.asset('assets/image/food.png',
            fit: BoxFit.cover,
            ),
            ),
            // SizedBox(height: 16.0),
            // Text('Home',
            //   style: TextStyle(fontSize: 15.0),
            // ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
                // Add your button click logic here
                print('Button pressed!');
              },
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blue[200]!)),
              child: Text('Profile'),
            ),
          ],
        ),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Start',
                style: TextStyle(fontSize: 15.0),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Add your button click logic here
                  print('Button pressed!');
                },
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blue[200]!)),
                child: Text('Get Diet Recommendation'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                // Add your button click logic here
                  print('Button pressed!');
                 },
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blue[200]!)),
                child: Text('Get Exercise Recommendation'),
              ),
            ],
          ),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddPage()),
                );
              },
              child: Text('Go to Add Page'),
            ),
            SizedBox(height: 16.0), // Optional: Add spacing between button and text
            Text('Add'),
          ],
        ),
      ),
    );
  }
}


