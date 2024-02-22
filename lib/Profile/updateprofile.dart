import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:majorproject/Profile/profile.dart';
import 'package:majorproject/src/constants/colors.dart';
import 'package:majorproject/src/constants/sizes.dart';
import 'package:majorproject/src/constants/text_strings.dart';
// import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart';
import '../service/api.dart';
import 'package:fluttertoast/fluttertoast.dart';


class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  static const String _title = 'Update Page';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title,
          style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.grey,
        ),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController pressureController = TextEditingController();
  TextEditingController sugarController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  // String? selectedImagePath;
  int ?weight;
  double ?height;
  int ?pressure;
  int ?sugar;
  int ?age;
  String? selectedGender;

  userinfo() async {

    Map data = {
      "weight":weight,
      "height":height,
      "pressure":pressure,
      "sugar":sugar,
      "age":age,
      "gender": selectedGender,
    };
    Response response = await api.Post(
        "http://major.dns.army/api/ufeature", jsonEncode(data));
    Map responseMap = jsonDecode(response.body);
    if (response.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(
          builder: (context) => const ProfileScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(ProfileController());
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
        title: Text(tEditProfile, style: Theme.of(context).textTheme.headline4),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              // -- IMAGE with ICON
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset('assets/image/logo.png'))
                  ),
                  // Positioned(
                  //   bottom: 0,
                  //   right: 0,
                  //   child: Container(
                  //     width: 35,
                  //     height: 35,
                  //     decoration:
                  //     BoxDecoration(borderRadius: BorderRadius.circular(100), color: tPrimaryColor),
                  //     child: const Icon(LineAwesomeIcons.camera, color: Colors.black, size: 20),
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(height: 50),

              // -- Form Fields
              Form(
                child: Column(
                  children: [
                    // TextFormField(
                    //   decoration: const InputDecoration(
                    //       label: Text(tFullName), prefixIcon: Icon(LineAwesomeIcons.user)),
                    //   onChanged: (value) {
                    //     weight= double.parse(value);
                    //   },
                    // ),
                    const SizedBox(height: tFormHeight - 20),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'Gender',
                        prefixIcon: Icon(LineAwesomeIcons.user),
                      ),
                      value: selectedGender,
                      items: ['male', 'female'].map((String gender) {
                        return DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedGender = newValue!;
                        });
                      },
                    ),
                    const SizedBox(height: tFormHeight - 20),
                    TextFormField(
                      controller: heightController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          label: Text(tHeight), prefixIcon: Icon(LineAwesomeIcons.text_height)),
                      onChanged: (value) {
                        height= double.parse(value);
                      },
                    ),
                    const SizedBox(height: tFormHeight - 20),
                    TextFormField(
                      controller: weightController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          label: Text(tWeight), prefixIcon: Icon(LineAwesomeIcons.weight)),
                      onChanged: (value) {
                        weight= int.parse(value);
                      },
                    ),
                    TextFormField(
                      controller: pressureController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          label: Text(tPressure), prefixIcon: Icon(LineAwesomeIcons.prescription)),
                      onChanged: (value) {
                        pressure= int.parse(value);
                      },
                    ),
                    TextFormField(
                      controller: sugarController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          label: Text(tSugar), prefixIcon: Icon(LineAwesomeIcons.prescription_bottle)),
                      onChanged: (value) {
                        sugar= int.parse(value);
                      },
                    ),
                    const SizedBox(height: tFormHeight - 20),
                    TextFormField(
                      controller: ageController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          label: Text(tAge), prefixIcon: Icon(LineAwesomeIcons.user_clock)),
                      onChanged: (value) {
                        age= int.parse(value);
                      },
                    ),
                    const SizedBox(height: tFormHeight - 20),
                    const SizedBox(height: tFormHeight),

                    // -- Form Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          if (weightController.text.isEmpty ||
                              heightController.text.isEmpty ||
                              ageController.text.isEmpty ||
                              pressureController.text.isEmpty ||
                              sugarController.text.isEmpty) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Please fill all the fields"),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(); // Close the dialog
                                      },
                                      child: Text("OK"),
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            // All fields are filled, proceed with form submission
                            userinfo();
                            Fluttertoast.showToast(
                              msg: 'Information Added',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.grey,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ProfileScreen()),
                            );
                          }
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: tPrimaryColor,
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: const Text('Add Information'),
                        // child: const Text(tEditProfile, style: TextStyle(color: tDarkColor)),
                      ),
                    ),
                    const SizedBox(height: tFormHeight),

                    // -- Created Date and Delete Button
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     const Text.rich(
                    //       TextSpan(
                    //         text: tJoined,
                    //         style: TextStyle(fontSize: 12),
                    //         children: [
                    //           TextSpan(
                    //               text: tJoinedAt,
                    //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))
                    //         ],
                    //       ),
                    //     ),
                    //     ElevatedButton(
                    //       onPressed: () {},
                    //       style: ElevatedButton.styleFrom(
                    //           backgroundColor: Colors.redAccent.withOpacity(0.1),
                    //           elevation: 0,
                    //           foregroundColor: Colors.red,
                    //           shape: const StadiumBorder(),
                    //           side: BorderSide.none),
                    //       child: const Text(tDelete),
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


