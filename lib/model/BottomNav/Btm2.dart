import 'package:flutter/material.dart';

class StatusFragment extends StatefulWidget {
  const StatusFragment({Key? key}) : super(key: key);

  @override
  State<StatusFragment> createState() => _StatusFragmentState();
}

class _StatusFragmentState extends State<StatusFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Start'),
      ),
    );
  }
}
