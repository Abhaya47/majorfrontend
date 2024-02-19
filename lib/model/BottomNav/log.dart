import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../user_food.dart';
import '../../service/api.dart';


class Log extends StatelessWidget {
  Log({Key? key}) : super(key: key);
  final api apis=api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('User'),
      // ),
      body: FutureBuilder(
        future: apis.GetFood(
          "http://major.dns.army/api/food?date=2024-02-15"
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
