import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:majorproject/Profile/profile.dart';
import 'package:majorproject/Profile/user_info.dart';
import '../../service/api.dart';



class MyInformation extends StatelessWidget {
  MyInformation({Key? key}) : super(key: key);
  final api apis=api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) => const ProfileScreen())
              );
            }
            , icon: const Icon(LineAwesomeIcons.angle_left)),
        title: const Text('My Information'),
      ),
      body: FutureBuilder(
        future: apis.Getufeature("http://major.dns.army/api/ufeature"        ),

        builder: (BuildContext context, AsyncSnapshot<List<InfoPosts>>snapshot) {
          if (snapshot.hasData) {
            List<InfoPosts>?posts = snapshot.data;
            return ListView(
              children: posts!
                  .map(
                    (InfoPosts post) =>Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                          ),
                          child: const Center(child: Text("PERSONAL INFO",
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.deepPurple),
                            maxLines: 1,)),
                        ),Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                          ),
                          child: Center(child: Text("Weight  :  "+post.weight.toString(),
                            style: const TextStyle(fontSize: 24,color: Colors.lightBlue),
                            maxLines: 1,)),
                        ),
                        Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(

                          ),
                          child: Center(child: Text("Height  :  "+ post.height.toString(),
                            style: const TextStyle(fontSize: 24,color: Colors.lightGreen),
                            maxLines: 1,)),
                        ),
                        Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(

                          ),
                          child: Center(child: Text("Gender  :  "+ post.gender.toString(),
                            style: const TextStyle(fontSize: 24,color: Colors.lightGreen),
                            maxLines: 1,)),
                        ),
                        Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(

                          ),
                          child: Center(child: Text("pressure  :  "+ post.pressure.toString(),
                            style: const TextStyle(fontSize: 24,color: Colors.lightGreen),
                            maxLines: 1,)),
                        ),Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(

                          ),
                          child: Center(child: Text("sugar  :  "+ post.sugar.toString(),
                            style: const TextStyle(fontSize: 24,color: Colors.lightGreen),
                            maxLines: 1,)),
                        ),Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(

                          ),
                          child: Center(child: Text("age  :  "+ post.age.toString(),
                            style: const TextStyle(fontSize: 24,color: Colors.lightGreen),
                            maxLines: 1,)),
                        ),
                      ],
                    ),
                  ),
                ),
              )
                  .toList(),
            );
          }else{
            print("COULD NOT GET ANY DATA");
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}