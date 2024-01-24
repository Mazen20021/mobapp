import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:app/GPS/place_tracker_app.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Row(
          children: [
            const Text("SVIG"),
            const SizedBox(width: 5),
            Image.asset(
              "assets/images/dice-3.png",
              width: 30,
              color: const Color.fromARGB(255, 33, 42, 52),
            ),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              text: ("Feed"),
              icon: Icon(
                Icons.feed_rounded,
              ),
            ),
            Tab(
              text: ("Holders"),
              icon: Icon(
                Icons.person_add_alt_1,
                //size: 40,
              ),
            ),
            Tab(
              text: ("Track"),
              icon: Icon(Icons.radar_rounded),
            ),
            Tab(
              text: ("Stream"),
              icon: Icon(Icons.streetview_sharp),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          const NestedTabBar('Feed'),
          const NestedTabBarconf('Holders'),
          Container(
            color: const Color.fromARGB(255, 33, 42, 52),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // SizedBox(
                    //   height: 800,
                    //   width: 800,
                    //   // child: ChangeNotifierProvider(
                    //   //   create: (context) => AppState(),
                    //   //   child: const PlaceTrackerApp(),
                    //   ),
                    // ),
                    //tracking(),
                  ],
                ),
              ),
            ),
          ),
          //NestedTabBar('Track'),
          Container(
            color: const Color.fromARGB(255, 33, 42, 52),
            child: const Center(
              child: Text(
                "Stream",
                style: TextStyle(color: Color.fromARGB(255, 144, 145, 72)),
              ),
            ),
          ),
          // NestedTabBar('Stream'),
        ],
      ),
    );
  }
}

class NestedTabBar extends StatefulWidget {
  const NestedTabBar(this.outerTab, {super.key});

  final String outerTab;

  @override
  State<NestedTabBar> createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TabBar.secondary(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(text: 'Overview'),
            Tab(text: 'Specifications'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Card(
                color: const Color.fromARGB(255, 33, 42, 52),
                margin: const EdgeInsets.all(16.0),
                child: Center(
                    child: Text(
                  '${widget.outerTab}: Overview tab',
                  style:
                      const TextStyle(color: Color.fromARGB(255, 144, 145, 72)),
                )),
              ),
              Card(
                color: const Color.fromARGB(255, 33, 42, 52),
                margin: const EdgeInsets.all(16.0),
                child: Center(
                    child: Text(
                  '${widget.outerTab}: Specifications tab',
                  style:
                      const TextStyle(color: Color.fromARGB(255, 144, 145, 72)),
                )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NestedTabBarconf extends StatefulWidget {
  const NestedTabBarconf(this.outerTab, {super.key});

  final String outerTab;

  @override
  State<NestedTabBarconf> createState() => _NestedTabBarStateconf();
}

class _NestedTabBarStateconf extends State<NestedTabBarconf>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TabBar.secondary(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(text: 'New Holder'),
            Tab(text: 'Current Holders'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Card(
                color: const Color.fromARGB(255, 33, 42, 52),
                margin: const EdgeInsets.all(16.0),
                child: Center(
                    child: Text(
                  '${widget.outerTab}: Overview tab',
                  style:
                      const TextStyle(color: Color.fromARGB(255, 144, 145, 72)),
                )),
              ),
              Card(
                color: const Color.fromARGB(255, 33, 42, 52),
                margin: const EdgeInsets.all(16.0),
                child: Center(
                    child: Text(
                  '${widget.outerTab}: Specifications tab',
                  style:
                      const TextStyle(color: Color.fromARGB(255, 144, 145, 72)),
                )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
