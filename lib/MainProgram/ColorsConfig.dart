import 'package:flutter/material.dart';
import 'package:app/MainProgram/ActiveButtons.dart';

const begall = Alignment.topLeft;
const endall = Alignment.bottomRight;

class ColorConfig extends StatelessWidget {
  const ColorConfig(this.colorlist, {super.key});
  final List<Color> colorlist;
  @override
  Widget build(BuildContext context) {
    return Container(
      //to decorate our app
      decoration: BoxDecoration(
        //to make colors be gradiented
        gradient: LinearGradient(colors: colorlist, begin: begall, end: endall),
      ),
      //making a child of container and the text in the center
      child: const Center(
        child: ColorConfigs(),
      ),
    );
  }
}
