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
        backgroundColor: const Color.fromARGB(255, 225, 213, 201),
        title: Row(children: [
          const Text("SVIG"),
          const SizedBox(width: 5),
          Image.asset(
            "assets/images/dice-3.png",
            width: 30,
            color: const Color.fromARGB(255, 33, 42, 52),
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
      backgroundColor: const Color.fromARGB(255, 31, 35, 38),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                    width: 200,
                    height: 400,
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(104, 51, 57, 115),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            )),
                        onPressed: Feed,
                        icon: const Icon(
                          Icons.feedback_outlined,
                          size: 100,
                          color: Color.fromARGB(176, 197, 147, 76),
                        ),
                        label: const Text(""))),
                SizedBox(
                    width: 211,
                    height: 400,
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 31, 35, 38),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            )),
                        onPressed: Add,
                        icon: const Icon(
                          Icons.add_circle_outlined,
                          size: 100,
                          color: Color.fromARGB(255, 197, 147, 76),
                        ),
                        label: const Text(""))),
              ],
            ),
            Row(
              children: [
                SizedBox(
                    width: 200,
                    height: 370,
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(179, 75, 121, 77),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            )),
                        onPressed: Nav,
                        icon: const Icon(
                          Icons.emergency_share,
                          size: 100,
                          color: Color.fromARGB(164, 33, 120, 234),
                        ),
                        label: const Text(""))),
                SizedBox(
                    width: 211,
                    height: 370,
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 208, 185, 135),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            )),
                        onPressed: Stream,
                        icon: const Icon(
                          Icons.camera_indoor_rounded,
                          size: 100,
                          color: Color.fromARGB(255, 31, 35, 38),
                        ),
                        label: const Text(""))),
              ],
            ),
          ],
        ),
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
