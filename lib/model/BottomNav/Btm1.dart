import 'package:flutter/material.dart';

class ChatFragement extends StatefulWidget {
  const ChatFragement({Key? key}) : super(key: key);

  @override
  State<ChatFragement> createState() => _ChatFragementState();
}

class _ChatFragementState extends State<ChatFragement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
