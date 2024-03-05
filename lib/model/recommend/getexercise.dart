import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:majorproject/Profile/profile.dart';
import 'package:majorproject/Profile/user_info.dart';
import 'package:majorproject/third.dart';
import '../../service/api.dart';
import 'package:majorproject/model/recommend/exercisemodel.dart';

class GetExercise extends StatelessWidget {
  GetExercise({Key? key}) : super(key: key);
  final api apis=api();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MyTabBar()));
              },
              icon: const Icon(LineAwesomeIcons.angle_left)),
          title: Text('Exercise Details'),
        ),
        body: FutureBuilder(
          future: apis.GetExercise("http://major.dns.army/api/recommendexercise"),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              List<ExercisePost>?posts=snapshot.data;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Exercises and Durations",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.deepPurple),
                      ),
                    ),
                    ...posts!.map((ExercisePost post) => Card(
                      margin: EdgeInsets.all(10),
                      child: ListTile(
                        leading: Icon(LineAwesomeIcons.user_astronaut, color: Colors.deepPurple),
                        title: Text(
                          "Details",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 29),
                        ),
                        subtitle: Text(
                          "Weight: ${post.exerciseNames} kg\n"
                              "Height: ${post.durations} m\n",
                          style: TextStyle(fontSize: 22),
                        ),
                        isThreeLine: true,
                      ),
                    )),
                  ],
                ),
              );
            } else {
              return Text('No exercise details available');
            }
          },
        ),
      ),
    );
  }
}
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => const MyTabBar()));
//               },
//               icon: const Icon(LineAwesomeIcons.angle_left)),
//           title: Text('Exercise Details'),
//         ),
//         body: ExerciseDetails(),
//       ),
//     );
//   }
// }
//
// class ExerciseDetails extends StatelessWidget {
//   // final double bmi = 30.0;
//   // final double systolicPressure = 170.0;
//   // final double sugarLevel = 90.0;
//   final List<double> durations = [28, 29, 29];
//   final List<String> exerciseNames = ['Moderate Jogging', 'Nordic Walking', 'Gymnastics'];
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: <Widget>[
//         // ListTile(
//         //   title: Text('BMI'),
//         //   trailing: Text(bmi.toString()),
//         // ),
//         // ListTile(
//         //   title: Text('Systolic Pressure'),
//         //   trailing: Text('$systolicPressure mmHg'),
//         // ),
//         // ListTile(
//         //   title: Text('Sugar Level'),
//         //   trailing: Text('$sugarLevel mg/dL'),
//         // )
//         // Divider(),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text('Exercises and Durations:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//         ),
//         for (int i = 0; i < exerciseNames.length; i++)
//           ListTile(
//             title: Text(exerciseNames[i]),
//             trailing: Text('${durations[i].toStringAsFixed(2)} minutes'),
//           ),
//       ],
//     );
//   }
// }