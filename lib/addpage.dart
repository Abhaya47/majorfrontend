import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _foodController = TextEditingController();
  TextEditingController _exerciseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Page'),
      ),
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
                ),
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please enter your food';
                //   }
                //   return null;
                // },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _exerciseController,
                decoration: InputDecoration(
                  labelText: 'Exercise',
                  hintText: 'Enter your exercise',
                ),
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please enter your exercise';
                //   }
                //   return null;
                // },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Perform the form submission
                    String food = _foodController.text;
                    String exercise = _exerciseController.text;

                    // You can handle the data (food and exercise) here, for example, save it to a database
                    print('Food: $food, Exercise: $exercise');

                    // Optionally, you can navigate to another page after form submission
                    Navigator.pop(context);
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _foodController.dispose();
    _exerciseController.dispose();
    super.dispose();
  }
}
