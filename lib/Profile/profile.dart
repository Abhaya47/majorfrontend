import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:majorproject/Profile/putprofile.dart';
import 'package:majorproject/main.dart';
// import 'package:majorproject/model/BottomNav/MyTabBar.dart';
import 'package:majorproject/src/constants/colors.dart';
import 'package:majorproject/src/constants/sizes.dart';
import 'package:majorproject/src/constants/text_strings.dart';
import 'package:majorproject/Profile/updateprofile.dart';
import 'package:majorproject/Profile/profilemenu.dart';
import 'package:majorproject/third.dart';
import 'package:get/get.dart';
import 'package:majorproject/third.dart';
import 'package:flutter/services.dart';
import 'package:majorproject/Profile/Myinformation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majorproject/Screen/first.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) => MyTabBar())
              );
        },
        icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text(tProfile, style: Theme.of(context).textTheme.headline4),
        actions: [IconButton(onPressed: () {}, icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [

              /// -- IMAGE
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: InkWell (
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const UpdateProfileScreen()));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100), child: Image.asset('assets/image/logo.png')),
                  ),
                  ),
                  // Positioned(
                  //   bottom: 0,
                  //   right: 0,
                  //   child: Container(
                  //     width: 35,
                  //     height: 35,
                  //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: tPrimaryColor),
                  //     child: IconButton(
                  //       onPressed: () {
                  //         Navigator.push(
                  //             context, MaterialPageRoute(
                  //             builder: (context) => const UpdateProfileScreen())
                  //         );
                  //       },icon: const Icon(
                  //       LineAwesomeIcons.alternate_pencil,
                  //       color: Colors.black,
                  //       size: 20,
                  //     ),
                  //   ),
                  //   ),
                  // ),
                ],

              ),
              const SizedBox(height: 10),
              Text(tProfileHeading, style: Theme.of(context).textTheme.headline4),
              Text(tProfileSubHeading, style: Theme.of(context).textTheme.headline6?.copyWith(fontStyle: FontStyle.italic, color: Colors.grey)),
              const SizedBox(height: 20),

              /// -- BUTTON
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  // onPressed: () => Get.to(() => const UpdateProfileScreen()),
                  onPressed: () {
                    Navigator.push(
                        context,MaterialPageRoute(
                        builder: (context) => const UpdateProfileScreen())
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[200], side: BorderSide.none, shape: const StadiumBorder()),
                  child: const Text(tEditProfile, style: TextStyle(color: tDarkColor)),
                ),
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 10),

              /// -- BUTTON
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  // onPressed: () => Get.to(() => const UpdateProfileScreen()),
                  onPressed: () {
                    Navigator.push(
                        context,MaterialPageRoute(
                        builder: (context) => const PutProfileScreen())
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[200], side: BorderSide.none, shape: const StadiumBorder()),
                  child: const Text(tUpdateProfile, style: TextStyle(color: tDarkColor)),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              /// -- MENU
              // ProfileMenuWidget(title: "Settings", icon: LineAwesomeIcons.cog, onPress: () {}),
              // ProfileMenuWidget(title: "Billing Details", icon: LineAwesomeIcons.wallet, onPress: () {}),
              // ProfileMenuWidget(title: "User Management", icon: LineAwesomeIcons.user_check, onPress: () {}),
              const SizedBox(height: 10),
              ProfileMenuWidget(title: "My Information", icon: LineAwesomeIcons.info, onPress: () async {
                debugPrint('My Information');
                Navigator.of(context, rootNavigator: true)
                   .pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) { return MyInformation(); }, ), (_) => false);
              }
              ),

              ProfileMenuWidget(
                  title: "Logout",
                  icon: LineAwesomeIcons.alternate_sign_out,
                  endIcon: false,
                  onPress:  () async {
                    debugPrint('Sign Out');
                    Navigator.of(context, rootNavigator: true)
                        .pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context)
                    { return LoginPage(); }, ), (_) => false,);
                  }
              )
              // ProfileMenuWidget(
              //     title: "Logout",
              //     icon: LineAwesomeIcons.alternate_sign_out,
              //     textColor: Colors.red,
              //     endIcon: false,
              //     onPress: () {
              //       Get.defaultDialog(
              //         title: "LOGOUT",
              //         titleStyle: const TextStyle(fontSize: 20),
              //         content: const Padding(
              //           padding: EdgeInsets.symmetric(vertical: 15.0),
              //           child: Text("Are you sure, you want to Logout?"),
              //         ),
              //         confirm: Expanded(
              //           child: ElevatedButton(
              //             onPressed: () {
              //              Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
              //             },
              //             style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, side: BorderSide.none),
              //             child: const Text("Yes"),
              //           ),
              //         ),
              //         cancel: OutlinedButton(onPressed: () => Get.back(), child: const Text("No")),
              //       );
              //     }),

            ],
          ),
        ),
      ),
    );
  }

  // logout(BuildContext context)
  // {
  //   final storage = new FlutterSecureStorage();
  //   storage.delete(key: 'token');
  //   //redirect to login page
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(builder:
  //           (context) => const MyApp()
  //   ));

  }