//home page
import 'package:flutter/material.dart';
import 'package:majorproject/Profile/profile.dart';
import 'package:majorproject/addpage.dart';
import 'model/BottomNav/log.dart';
import 'Exercise/exercises.dart';
import 'package:majorproject/Profile/profile.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({Key? key}) : super(key: key);

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  int selectedIndex = 0;

  final double age = 10;
  final double bmi=20;

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
        backgroundColor: Colors.grey,
        title: Text(
          "NutriCoach",
          style: TextStyle(fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
        ),
        actions: [
// <<<<<<< HEAD
//           // Person icon with dropdown menu
//           PopupMenuButton<String>(
//             onSelected: (value) {
//               // Handle menu item selection
//               // You can add logic based on the selected value
//               print(value);
//             },
//             itemBuilder: (BuildContext context) {
//                 return ["Information", "something"].map((String choice) {
//                 return PopupMenuItem<String>(
//                   value: choice,
//                   child: Text(choice),
//                 );
//               }).toList();
//             },
// =======
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen())
          );
          },
// >>>>>>> origin/main
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
              return ["My Profile" , "Logout"].map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
            icon: Icon(Icons.menu),
          ),
          // PopupMenuButton<String>(
          //   onSelected: (value) {
          //     // Handle menu item selection
          //     // You can add logic based on the selected value
          //     print(value);
          //   },
          //   itemBuilder: (BuildContext context) {
          //     return ["Settings", "Logout"].map((String choice) {
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
        fixedColor: Colors.grey,
        unselectedItemColor: Colors.grey,
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
                // Add your button click logic here
                print('Button pressed!');
              },
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.grey)),
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
  String frequency = "";
  bool showExerciseOptions = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  // RadioListTile(
                  //   title: Text("3 times a day"),
                  //   value: "3",
                  //   groupValue: frequency,
                  //   onChanged: (value) {
                  //     setState(() {
                  //       frequency = value.toString();
                  //     });
                  //   },
                  // ),

                  // RadioListTile(
                  //   title: Text("4 times a day"),
                  //   value: "4",
                  //   groupValue: frequency,
                  //   onChanged: (value) {
                  //     setState(() {
                  //       frequency = value.toString();
                  //     });
                  //   },
                  // ),
                ],
              ),
              SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  // Add your button click logic here
                  print('Button pressed!');
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.grey),),
                child: Text('Get Diet Recommendation',
                style:TextStyle(backgroundColor: Colors.grey)
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showExerciseOptions = true;
                  });
                  // Add your button click logic here
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const Exercises(age: 25.0, bmi: 22.0),
                  //   ),
                  // );
                  // print('Button pressed!');
                },
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.grey)),
                child: Text('Get Exercise Recommendation'),
              ),

              Visibility(
                visible: showExerciseOptions,
                child: Column(
                  children: [
                    RadioListTile(
                      title: Text("Abdominals"),
                      value: "Abdominals",
                      groupValue: frequency,
                      onChanged: (value) {
                        setState(() {
                          frequency = value.toString();
                        });
                      },
                    ),
                    // RadioListTile(
                    //   title: Text("Abductors"),
                    //   value: "Option 2",
                    //   groupValue: frequency,
                    //   onChanged: (value) {
                    //     setState(() {
                    //       frequency = value.toString();
                    //     });
                    //   },
                    // ),
                    // RadioListTile(
                    //   title: Text("Adductors"),
                    //   value: "Option 2",
                    //   groupValue: frequency,
                    //   onChanged: (value) {
                    //     setState(() {
                    //       frequency = value.toString();
                    //     });
                    //   },
                    // ),
                    RadioListTile(
                      title: Text("Biceps"),
                      value: "Biceps",
                      groupValue: frequency,
                      onChanged: (value) {
                        setState(() {
                          frequency = value.toString();
                        });
                      },
                    ),
                    // RadioListTile(
                    //   title: Text("Calves"),
                    //   value: "Option 2",
                    //   groupValue: frequency,
                    //   onChanged: (value) {
                    //     setState(() {
                    //       frequency = value.toString();
                    //     });
                    //   },
                    // ),
                    RadioListTile(
                      title: Text("Chest"),
                      value: "Chest",
                      groupValue: frequency,
                      onChanged: (value) {
                        setState(() {
                          frequency = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text("Forearms"),
                      value: "Forearms",
                      groupValue: frequency,
                      onChanged: (value) {
                        setState(() {
                          frequency = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text("Glutes"),
                      value: "Glutes",
                      groupValue: frequency,
                      onChanged: (value) {
                        setState(() {
                          frequency = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text("Hamstrings"),
                      value: "Hamstrings",
                      groupValue: frequency,
                      onChanged: (value) {
                        setState(() {
                          frequency = value.toString();
                        });
                      },
                    ),
                    // RadioListTile(
                    //   title: Text("Lats"),
                    //   value: "Option 2",
                    //   groupValue: frequency,
                    //   onChanged: (value) {
                    //     setState(() {
                    //       frequency = value.toString();
                    //     });
                    //   },
                    // ),
                    RadioListTile(
                      title: Text("Lower Back"),
                      value: "Lower Back",
                      groupValue: frequency,
                      onChanged: (value) {
                        setState(() {
                          frequency = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text("Middle Back"),
                      value: "Middle Back",
                      groupValue: frequency,
                      onChanged: (value) {
                        setState(() {
                          frequency = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text("Neck"),
                      value: "Neck",
                      groupValue: frequency,
                      onChanged: (value) {
                        setState(() {
                          frequency = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text("Quadriceps"),
                      value: "Quadriceps",
                      groupValue: frequency,
                      onChanged: (value) {
                        setState(() {
                          frequency = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text("Shoulders"),
                      value: "Shoulders",
                      groupValue: frequency,
                      onChanged: (value) {
                        setState(() {
                          frequency = value.toString();
                        });
                      },
                    ),
                    // RadioListTile(
                    //   title: Text("Traps"),
                    //   value: "Option 2",
                    //   groupValue: frequency,
                    //   onChanged: (value) {
                    //     setState(() {
                    //       frequency = value.toString();
                    //     });
                    //   },
                    // ),
                    RadioListTile(
                      title: Text("Triceps"),
                      value: "Triceps",
                      groupValue: frequency,
                      onChanged: (value) {
                        setState(() {
                          frequency = value.toString();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ),
      ),
    );
  }
}

          // Exercises widget
        //   class Exercises extends StatefulWidget {
        // const Exercises({Key? key, required this.age, required this.bmi}) : super(key: key);
        //
        // final double bmi;
        // final double age;
        //
        // @override
        // State<Exercises> createState() => _ExercisesState();
        // }
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

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


