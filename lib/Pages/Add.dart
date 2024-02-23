import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/Extras/comHelper.dart';
import 'package:app/DB/DBConnection.dart';
import 'package:app/MainProgram/ActiveButtons.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:app/Pages/Setting.dart';
// import 'package:flutter_blue/flutter_blue.dart';
import 'package:app/GPS/Maps.dart';
import 'package:app/Extras/Server.dart';

class Addholder extends StatefulWidget {
  const Addholder({super.key});
  @override
  State<Addholder> createState() {
    return _add();
  }
}

class _add extends State<Addholder> with TickerProviderStateMixin {
  List<String> idused = List<String>.empty(growable: true);
  var DBHelper = DatabaseHelper();
  late final TabController _tabController;
  final TextEditingController _holdername = TextEditingController();
  final TextEditingController _holderid = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  DatabaseHelper d = DatabaseHelper();
  Holder? holder;
  String holderidgot = "", holdernamegot = "";
  bool GID = false;
  bool HName = false;
  bool correctdata = false;
  bool found = false;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    DBHelper = DatabaseHelper();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  bool onChanged() {
    return false;
  }

  bool check_if_found() {
    if (idused.contains(_holderid.text)) {
      print('not found');
      found = true;
    } else {
      print('not found');
      found = false;
      idused.add(_holderid.text);
    }
    return found;
  }

  void getHolderData() async {
    List<Map<String, dynamic>> result = await d.fetchHolder();
    WidgetsFlutterBinding.ensureInitialized();
    DatabaseHelper.instance.database;

    print("I am Here 1");
    if (result.isNotEmpty) {
      setState(() {
        holder = Holder(
          id: result[0]['ID'] ?? '',
          name: result[0]['Name'] ?? '',
        );
        holderidgot = holder!.id;
        holdernamegot = holder!.name;
        print("I am Here");
      });
    }
  }

  void showbot(BuildContext context, String loc) {}

  Future<void> _addholder(BuildContext context) async {
    print("HERE IAM " + GID.toString() + " " + HName.toString());
    WidgetsFlutterBinding.ensureInitialized();
    DatabaseHelper.instance.database;
    final form = _formkey.currentState;
    String HolderID = _holderid.text;
    String HolderName = _holdername.text;
    if (GID && HName) {
      correctdata = true;
    }
    if (form != null && !form.validate()) {
      alertDialog(context, "Please Enter GlassesID");
      alertDialog(context, "Please Enter HolderName");
    } else {
      if (correctdata) {
        _formkey.currentState!.save();
        GID = false;
        HName = false;
        correctdata = false;
        Map<String, dynamic> holders = {
          'ID': HolderID,
          'Name': HolderName,
          'Email': email,
        };
        check_if_found();
        if (found) {
          // Display an error message
          print("ERROR");
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text(
                'Error!',
                style: TextStyle(fontSize: 30),
              ),
              content: const Text(
                'Failed to add this Holder. The entered Holder already exists.',
                style: TextStyle(fontSize: 20),
              ),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          );
        } else {
          getHolderData();
          // Add Holder to the Set and the database
          int userId = await DBHelper.addholder(holders);
          if (userId != 0) {
            print("Email: " + email + "\n");
            print("Holder ADDED");
            showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text(
                  'Operation Succeeded',
                  style: TextStyle(fontSize: 20),
                ),
                content: Text(
                  'Holder ($HolderName) Added!',
                  style: TextStyle(fontSize: 20),
                ),
                actions: [
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            );
          }
        }
      }
    }
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
              )
            ])),
        key: _formkey,
        body: Form(
            child: Column(
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
                    color: const Color.fromARGB(255, 17, 22, 27),
                    margin: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Center(
                          child: Column(
                        children: [
                          const SizedBox(height: 50),
                          const Text(
                            'ADD Holders',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 40),
                          ),
                          const SizedBox(height: 80),
                          SizedBox(
                            width: 350,
                            child: TextFormField(
                              cursorColor: Colors.white,
                              controller: _holderid,
                              obscureText: false,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "Please Enter GlassesID";
                                }
                                GID = true;
                              },
                              onSaved: (val) => _holderid.text = val!,
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(60)),
                                  borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
                                prefixIcon: Icon(Icons.person),
                                labelText: 'GlassesID',
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 50),
                          SizedBox(
                            width: 350,
                            child: TextFormField(
                              cursorColor: Colors.white,
                              controller: _holdername,
                              obscureText: false,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "Please Enter Holder's Name";
                                }
                                HName = true;
                              },
                              onSaved: (val) => _holdername.text = val!,
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(60)),
                                  borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
                                prefixIcon: Icon(Icons.person),
                                labelText: 'HolderName',
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 80),
                          ElevatedButton.icon(
                              onPressed: () => _addholder(context),
                              icon: const Icon(Icons.add_box_rounded, size: 30),
                              label: const Text("ADD",
                                  style: TextStyle(fontSize: 20))),
                          const SizedBox(height: 20),
                        ],
                      )),
                    ),
                  ),
                  Card(
                    color: const Color.fromARGB(255, 17, 22, 27),
                    margin: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 15),
                        DataTable(columnSpacing: 30, columns: const [
                          DataColumn(
                              label: Text(
                            "GlassesID",
                            style: TextStyle(color: Colors.white),
                          )),
                          DataColumn(
                              label: Text("Name",
                                  style: TextStyle(color: Colors.white))),
                          DataColumn(
                            label: Text("Location",
                                style: TextStyle(color: Colors.white)),
                          ),
                          DataColumn(
                            label: Text("  Show",
                                style: TextStyle(color: Colors.white)),
                          )
                        ], rows: [
                          DataRow(cells: [
                            DataCell(
                              Text("   " + holderidgot,
                                  style: const TextStyle(color: Colors.white)),
                            ),
                            DataCell(
                              Text(holdernamegot,
                                  style: const TextStyle(color: Colors.white)),
                            ),
                            const DataCell(
                              Text("  Home",
                                  style: TextStyle(color: Colors.white)),
                            ),
                            DataCell(
                              TextButton.icon(
                                onPressed: () =>
                                    showbot(context, "30°04'13.2N31°14'29.8E"),
                                style: TextButton.styleFrom(
                                  fixedSize: const Size.fromRadius(5),
                                  backgroundColor:
                                      const Color.fromARGB(0, 144, 145, 72),
                                ),
                                label: const Text(""),
                                icon: const Icon(Icons.radar_rounded,
                                    color: Colors.white),
                              ),
                            )
                          ]),
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )));
  }
}
