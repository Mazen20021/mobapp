import 'package:flutter/material.dart';
import 'package:app/MainProgram/ColorsConfig.dart';

void main() {
  runApp(const SVIG()); //start application
}

//class extends stateless --> for text and other stateless widgets statefull --> buttons and actions
class SVIG extends StatelessWidget {
  //constructor
  const SVIG({super.key});
  @override
  Widget build(BuildContext context) {
    //main widget
    return const MaterialApp(
        //home of the app and Scaffold for making app look nicer
        home: Scaffold(
      //the app is consists of head , body
      //to get decoration
      body: ColorConfig(
          [Color.fromARGB(144, 114, 145, 0), Color.fromARGB(80, 42, 53, 0)]),
    ));
  }
}
