import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../user_food.dart';
import '../../service/api.dart';
import 'package:majorproject/choose_food.dart';


class Rec extends StatelessWidget {
  Rec({Key? key}) : super(key: key);
  final api apis=api();
  // DateTime now = new DateTime.now();
  // // DateTime date = new DateTime(now.year, now.month, now.day);
  // print(date);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('User'),
      // ),
      body: FutureBuilder(
        future: apis.GetFood(
            "http://major.dns.army/api/recommend"
        ),

        builder: (BuildContext context, AsyncSnapshot<List<FoodPost>>snapshot) {
          if (snapshot.hasData) {
            List<FoodPost>?posts = snapshot.data;
            return ListView(
              children: posts!
                  .map(
                    (FoodPost post) =>Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Container(
                      height: 50,
                      width: double.minPositive,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.black12,
                                Colors.white70
                              ]
                          ),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black)
                      ),
                      child: Center(child: Text(post.name,
                        style: const TextStyle(fontSize: 12,color: Colors.white),
                        maxLines: 1,)),
                    ),
                    onTap:() => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => choose_food(post),
                      ),
                    ),
                  ),
                ),
              )
                  .toList(),
            );
          }else{
            print("COULD NOT GET DATA FOR FOOD");
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
