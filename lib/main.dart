import 'package:flutter/material.dart';
import 'package:app/MainProgram/ColorsConfig.dart';
import 'package:app/DB/DBConnection.dart';
import 'package:app/MainProgram/ActiveButtons.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseHelper.instance.database;

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
      body: Center(
        child: Card(
            margin: EdgeInsets.all(15),
            color: Color.fromARGB(255, 255, 208, 236),
            child: ColorConfigs()),
      ),
      backgroundColor: Color.fromARGB(255, 31, 37, 68),
      // ColorConfig([
      //   Color.fromARGB(255, 212, 201, 226),
      //   Color.fromARGB(255, 213, 201, 225)
      // ]),
    ));
  }
}
