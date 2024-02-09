import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:majorproject/Profile/profile.dart';
import 'package:majorproject/src/constants/colors.dart';
import 'package:majorproject/src/constants/sizes.dart';
import 'package:majorproject/src/constants/text_strings.dart';
import 'package:get/get.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);


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
                        child: Image.asset('assets//logo.png')),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(100), color: tPrimaryColor),
                      child: const Icon(LineAwesomeIcons.camera, color: Colors.black, size: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),

              // -- Form Fields
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text(tFullName), prefixIcon: Icon(LineAwesomeIcons.user)),
                    ),
                    const SizedBox(height: tFormHeight - 20),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text(tHeight), prefixIcon: Icon(LineAwesomeIcons.text_height)),
                    ),
                    const SizedBox(height: tFormHeight - 20),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text(tWeight), prefixIcon: Icon(LineAwesomeIcons.weight)),
                    ),
                    const SizedBox(height: tFormHeight - 20),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text(tAge), prefixIcon: Icon(LineAwesomeIcons.user_clock)),
                    ),
                    const SizedBox(height: tFormHeight - 20),
                    // TextFormField(
                    //   obscureText: true,
                    //   decoration: InputDecoration(
                    //     label: const Text(tPassword),
                    //     prefixIcon: const Icon(Icons.fingerprint),
                    //     suffixIcon:
                    //     IconButton(icon: const Icon(LineAwesomeIcons.eye_slash), onPressed: () {}),
                    //   ),
                    // ),
                    const SizedBox(height: tFormHeight),

                    // -- Form Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context, MaterialPageRoute(
                              builder: (context) => const ProfileScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: tPrimaryColor,
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: const Text(tEditProfile, style: TextStyle(color: tDarkColor)),
                      ),
                    ),
                    const SizedBox(height: tFormHeight),

                    // -- Created Date and Delete Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text.rich(
                          TextSpan(
                            text: tJoined,
                            style: TextStyle(fontSize: 12),
                            children: [
                              TextSpan(
                                  text: tJoinedAt,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent.withOpacity(0.1),
                              elevation: 0,
                              foregroundColor: Colors.red,
                              shape: const StadiumBorder(),
                              side: BorderSide.none),
                          child: const Text(tDelete),
                        ),
                      ],
                    )
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
