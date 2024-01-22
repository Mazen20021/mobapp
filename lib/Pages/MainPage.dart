import 'package:flutter/material.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});
  @override
  State<Mainpage> createState() {
    return _mainpage();
  }
}

class _mainpage extends State<Mainpage> {
  void addholder() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 33, 42, 52),
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 144, 145, 72),
          title: Row(
            children: [
              const Text(
                "SVIG",
                style: TextStyle(
                    color: Color.fromARGB(255, 33, 42, 52), fontSize: 30),
              ),
              const SizedBox(width: 20),
              Image.asset(
                "assets/images/dice-3.png",
                width: 50,
                color: const Color.fromARGB(255, 33, 42, 52),
              ),
              const SizedBox(
                width: 100,
              ),
              TextButton.icon(
                onPressed: addholder,
                label: const Text(
                  "",
                ),
                icon: const Row(
                  children: [
                    SizedBox(
                      child: Icon(
                        Icons.more_horiz_rounded,
                        color: Color.fromARGB(255, 33, 42, 52),
                        size: 50,
                      ),
                    ),
                  ],
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 144, 145, 72),
                ),
              ),
            ],
          )),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Column(
                children: [
                  const SizedBox(height: 100),
                  Row(
                    children: [
                      const SizedBox(width: 20),
                      Column(
                        children: [
                          ElevatedButton.icon(
                            onPressed: addholder,
                            label: const Text(
                              "",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                            icon: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 70,
                                  child: Icon(
                                    Icons.person_add_alt_1,
                                    color: Color.fromARGB(255, 33, 42, 52),
                                    size: 80,
                                  ),
                                ),
                              ],
                            ),
                            style: OutlinedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 144, 145, 72),
                              fixedSize: const Size.fromHeight(100),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Add Holder",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(width: 110),
                      Column(
                        children: [
                          ElevatedButton.icon(
                            onPressed: addholder,
                            label: const Text(
                              "",
                            ),
                            icon: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 70,
                                  child: Icon(
                                    Icons.streetview_sharp,
                                    color: Color.fromARGB(255, 33, 42, 52),
                                    size: 80,
                                  ),
                                ),
                              ],
                            ),
                            style: OutlinedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 144, 145, 72),
                              fixedSize: const Size.fromHeight(100),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Live Stream",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 200),
                  Row(
                    children: [
                      const SizedBox(width: 30),
                      Column(
                        children: [
                          ElevatedButton.icon(
                            onPressed: addholder,
                            label: const Text(
                              "",
                            ),
                            icon: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 65,
                                  child: Icon(
                                    Icons.radar_rounded,
                                    color: Color.fromARGB(255, 33, 42, 52),
                                    size: 80,
                                  ),
                                ),
                              ],
                            ),
                            style: OutlinedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 144, 145, 72),
                              fixedSize: const Size.fromHeight(100),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Track",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(width: 125),
                      Column(
                        children: [
                          ElevatedButton.icon(
                            onPressed: addholder,
                            label: const Text(
                              "",
                            ),
                            icon: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 65,
                                  child: Icon(
                                    Icons.person_pin,
                                    color: Color.fromARGB(255, 33, 42, 52),
                                    size: 80,
                                  ),
                                ),
                              ],
                            ),
                            style: OutlinedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 144, 145, 72),
                              fixedSize: const Size.fromHeight(100),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Holders",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
