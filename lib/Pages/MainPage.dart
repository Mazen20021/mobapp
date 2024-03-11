import 'package:flutter/material.dart';
import 'package:app/Pages/Setting.dart';
import 'package:app/Pages/Add.dart';
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
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
          const SizedBox(
            width: 190,
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
            elevation: BorderSide.strokeAlignCenter,
            surfaceTintColor: const Color.fromARGB(255, 9, 76, 114),
            shadowColor: Colors.black,
            margin: const EdgeInsets.all(30),
            color: const Color.fromARGB(255, 97, 92, 92).withOpacity(0.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    ArcedSquareButton(
                      const [
                        Color.fromARGB(255, 74, 0, 32),
                        Color.fromARGB(255, 222, 2, 97)
                      ],
                      const Color.fromARGB(255, 255, 255, 255),
                      icon: Icons.feedback_rounded,
                      label: "Feed",
                      onPressed: Feed,
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    ArcedSquareButton(
                      const [
                        Color.fromARGB(255, 255, 105, 94),
                        Color.fromARGB(255, 248, 42, 26),
                      ],
                      const Color.fromARGB(225, 240, 250, 106),
                      icon: Icons.add_box_rounded,
                      label: "ADD",
                      onPressed: Add,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                Container(
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      ArcedSquareButton(
                        const [
                          Color.fromARGB(255, 16, 195, 104),
                          Color.fromARGB(224, 20, 105, 80)
                        ],
                        const Color.fromARGB(255, 250, 123, 91),
                        icon: Icons.emergency_share,
                        label: "Track",
                        onPressed: Track,
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                      ArcedSquareButton(
                        const [
                          Color.fromARGB(255, 253, 82, 64),
                          Color.fromARGB(255, 232, 187, 78)
                        ],
                        const Color.fromARGB(255, 255, 219, 219),
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
