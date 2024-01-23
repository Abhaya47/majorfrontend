import 'package:flutter/material.dart';

class CallFragment extends StatefulWidget {
  const CallFragment({Key? key}) : super(key: key);

  @override
  State<CallFragment> createState() => _CallFragmentState();
}

class _CallFragmentState extends State<CallFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('log'),
      ),
    );
  }
}
