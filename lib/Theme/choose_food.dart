import 'package:flutter/material.dart';
import 'package:majorproject/food_rec.dart';

class choose_food extends StatelessWidget {
  final FoodPost post;
  const choose_food(this.post, {Key? key}) : super(key: key);

  @override

  AddButtonPressed() async{
    Map data = {
      "name":post.name,
      "calorie":post.calorie,
      "description":"",
      "count":""
    };
    print(data);
    Response response = await api.Post(
        "http://major.dns.army/api/food", jsonEncode(data));
    Map responseMap = jsonDecode(response.body);
    if (response.statusCode == 200) {
      _showPopupMessage('Food Chosen'); // Show the popup message when the food is added successfully
      // //_showPopupMessage('Food Added');
      // Navigator.pushNamed(context, '/log');
    }
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                AddButtonPressed();
                _showPopupMessage('Are you sure?');
              },
            )
        ),
      ),
    ),
}
