import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('For Test widgets'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text("See the console"),
        ));
  }
}
