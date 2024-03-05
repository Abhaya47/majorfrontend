import 'package:flutter/material.dart';
import '../service/api.dart';
import 'dart:convert';
import 'package:http/http.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  void _showPopupMessage(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Food Added'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

String ?food = "";

  AddButtonPressed() async{
  Map data = {
  "name":food,
  "calorie":"200",
  "description":"",
  "count":""
  };
  print(data);
  Response response = await api.Post(
  "http://major.dns.army/api/food", jsonEncode(data));
  Map responseMap = jsonDecode(response.body);
  if (response.statusCode == 200) {
    _showPopupMessage('Food Added'); // Show the popup message when the food is added successfully
    // //_showPopupMessage('Food Added');
    // Navigator.pushNamed(context, '/log');
  }
  }
  final _formKey = GlobalKey<FormState>();
  TextEditingController _foodController = TextEditingController();
  //TextEditingController _exerciseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Add Page'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _foodController,
                decoration: InputDecoration(
                  labelText: 'Food',
                  hintText: 'Enter your food',
                  labelStyle: TextStyle(color: Colors.grey),
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                 onChanged: (value) {
                   food = value;
                 }
              ),

              SizedBox(height: 16.0),
              TextButton(
                  onPressed: () {
                AddButtonPressed();
                _showPopupMessage('Food Added');
              },
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.grey),
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _foodController.dispose();
    //_exerciseController.dispose();
    super.dispose();
  }
}
