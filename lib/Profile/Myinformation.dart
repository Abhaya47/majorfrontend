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
        future: apis.Getufeature(
            "http://major.dns.army/api/ufeature"
        ),

        builder: (BuildContext context, AsyncSnapshot<List<MyInfo>>snapshot) {
          if (snapshot.hasData) {
             List<MyInfo>?posts = snapshot.data;
            return ListView(
              children: posts!
                  .map(
                    (MyInfo post) =>Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Column(
                      children: [
                    Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.deepPurple,
                                Colors.black
                              ]
                          ),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black)
                      ),
                      child: Center(child: Text(post.weight.toString(),
                        style: const TextStyle(fontSize: 12,color: Colors.white),
                        maxLines: 1,)),
                    ),
                        Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.deepPurple,
                                    Colors.black
                                  ]
                              ),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.black)
                          ),
                          child: Center(child: Text(post.height.toString(),
                            style: const TextStyle(fontSize: 12,color: Colors.white),
                            maxLines: 1,)),
                        ),
                        Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.deepPurple,
                                    Colors.black
                                  ]
                              ),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.black)
                          ),
                          child: Center(child: Text(post.pressure.toString(),
                            style: const TextStyle(fontSize: 12,color: Colors.white),
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

