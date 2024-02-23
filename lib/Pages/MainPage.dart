import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/Extras/comHelper.dart';
import 'package:app/DB/DBConnection.dart';
import 'package:app/MainProgram/ActiveButtons.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:app/Pages/Setting.dart';
import 'package:app/Pages/Add.dart';
// import 'package:flutter_blue/flutter_blue.dart';
import 'package:app/GPS/Maps.dart';
import 'package:app/Extras/Server.dart';
import 'package:app/Extras/button.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});
  @override
  State<Mainpage> createState() {
    return _mainpage();
  }
}

class _mainpage extends State<Mainpage> with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void settings() {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: ((_) => const Settings())));
    });
  }

  void Feed() {
    setState(() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((_) => Server(
                    method: "Feed",
                  ))));
    });
  }

  void Nav() {
    setState(() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((_) => Server(
                    method: "Track",
                  ))));
    });
  }

  void Add() {
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: ((_) => Addholder())));
    });
  }

  void Track() {
    setState(() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((_) => Server(
                    method: "Track",
                  ))));
    });
  }

  void Stream() {
    setState(() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((_) => Server(
                    method: "Stream",
                  ))));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 208, 236),
        title: Row(children: [
          const Text("SVIG",
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
          const SizedBox(width: 5),
          Image.asset(
            "assets/images/dice-3.png",
            width: 30,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          const SizedBox(
            width: 192,
          ),
          TextButton.icon(
            onPressed: settings,
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
              minimumSize: MaterialStateProperty.all<Size>(Size.zero),
              alignment: Alignment.center,
            ),
            icon: const Icon(
              Icons.more_horiz_rounded,
              size: 40,
              color: Colors.black,
            ),
            label: const Text(""),
          )
        ]),
      ),
      backgroundColor: const Color.fromARGB(255, 225, 213, 201),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/dice-6.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Card(
            surfaceTintColor: Color.fromARGB(255, 9, 76, 114),
            shadowColor: Colors.black,
            margin: EdgeInsets.all(30),
            color: Color.fromARGB(255, 73, 52, 52).withOpacity(0.8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    ArcedSquareButton(
                      [
                        Color.fromARGB(255, 74, 0, 32),
                        Color.fromARGB(255, 222, 2, 97)
                      ],
                      Color.fromARGB(255, 255, 255, 255),
                      icon: Icons.feedback_rounded,
                      label: "Feed",
                      onPressed: Feed,
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    ArcedSquareButton(
                      [
                        Color.fromARGB(255, 255, 105, 94),
                        Color.fromARGB(255, 248, 42, 26),
                      ],
                      Color.fromARGB(225, 240, 250, 106),
                      icon: Icons.add_box_rounded,
                      label: "ADD",
                      onPressed: Add,
                    ),
                  ],
                ),
                SizedBox(
                  height: 200,
                ),
                Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      ArcedSquareButton(
                        [
                          Color.fromARGB(255, 16, 195, 104),
                          Color.fromARGB(224, 20, 105, 80)
                        ],
                        Color.fromARGB(255, 250, 123, 91),
                        icon: Icons.emergency_share,
                        label: "Track",
                        onPressed: Track,
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      ArcedSquareButton(
                        [
                          Color.fromARGB(255, 253, 82, 64),
                          Color.fromARGB(255, 232, 187, 78)
                        ],
                        Color.fromARGB(255, 255, 219, 219),
                        icon: Icons.video_camera_front_rounded,
                        label: "Stream",
                        onPressed: Stream,
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

void showbot(BuildContext context, String location) async {
  //Navigator.push(context, MaterialPageRoute(builder: ((_) => Server())));
  // final encodedLocation = Uri.encodeComponent(location);
  // final urlString =
  //     'https://www.google.com/maps/search/?api=1&query=$encodedLocation';
  // Uri ul = Uri(
  //   scheme: 'https',
  //   host: 'www.google.com',
  //   path: '/maps/search/?api=1&query=$encodedLocation',
  // );
  // if (await canLaunchUrl(ul)) {
  //   await launchUrl(ul);
  // } else {
  //   throw 'Could not launch $ul';
  // }
}
