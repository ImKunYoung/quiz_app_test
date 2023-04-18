import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery
        .of(context)
        .size;
    double width = screenSize.width;
    double height = screenSize.height;

    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: const Text('My Quiz App'),
        backgroundColor: Colors.deepPurple,
        leading: Container(),
      ),
    ));
  }
}