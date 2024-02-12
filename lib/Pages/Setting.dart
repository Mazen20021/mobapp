import 'package:flutter/material.dart';
import 'package:app/Pages/MainPage.dart';
import 'package:app/MainProgram/TextConfig.dart';
import 'package:app/DB/DBConnection.dart';
import 'package:app/Extras/comHelper.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});
  @override
  State<Settings> createState() {
    return _settings();
  }
}

class _settings extends State<Settings> {
  var DBHelper = DatabaseHelper();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _confpass = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  String user = "", email = "", pass = "", confpass = "";
  bool cuser = false;
  bool cemail = false;
  bool cpass = false;
  bool ccpass = false;
  bool correctdata = false;
  bool found = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //actionsIconTheme: Icon(Icons.arrow_back_ios_new_outlined),
        backgroundColor: const Color.fromARGB(255, 33, 42, 52),
        title: const Text("SignUp"),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 25),
      ),
      body: SingleChildScrollView(
        child: Form(
          //scrollDirection: Axis.vertical,
          key: _formkey,
          child: Container(
            child: Center(
              child: Column(
                children: [
                  Column(
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 50),
                      Image.asset(
                        "assets/images/dice-5.png",
                        width: 100,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                      //medium Part
                      const SizedBox(height: 80),
                      Column(
                        children: [
                          Row(
                            children: [
                              const SizedBox(width: 30),
                              SizedBox(
                                width: 225,
                                child: TextFormField(
                                  controller: _username,
                                  obscureText: false,
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return "Please Enter UserName";
                                    }
                                    cuser = true;
                                  },
                                  onSaved: (val) => _username.text = val!,
                                  style: const TextStyle(fontSize: 20),
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                          style: BorderStyle.solid,
                                          color: Colors.transparent),
                                    ),
                                    prefixIcon: Icon(Icons.person),
                                    labelText: 'UserName',
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              TextButton.icon(
                                onPressed: () => _settings(),
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 144, 145, 72),
                                ),
                                label: const ConfigText("Change",
                                    Color.fromARGB(255, 255, 255, 255), 20),
                                icon: const Icon(Icons.change_circle,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(height: 50),
                          Row(
                            children: [
                              const SizedBox(width: 30),
                              SizedBox(
                                width: 225,
                                child: TextFormField(
                                  controller: _emailController,
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return "Please Enter Email";
                                    }
                                    if (!validateEmail(val)) {
                                      return "Please Enter Valid Email Formate";
                                    }
                                    cemail = true;
                                    return null;
                                  },
                                  onSaved: (val) => _username.text = val!,
                                  autocorrect: true,
                                  obscureText: false,
                                  style: const TextStyle(fontSize: 20),
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                          style: BorderStyle.solid,
                                          color: Color.fromARGB(
                                              255, 144, 145, 72)),
                                    ),
                                    prefixIcon: Icon(Icons.email),
                                    labelText: 'Email',
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              TextButton.icon(
                                onPressed: () => _settings(),
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 144, 145, 72),
                                ),
                                label: const ConfigText("Change",
                                    Color.fromARGB(255, 255, 255, 255), 20),
                                icon: const Icon(Icons.change_circle,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(height: 50),
                          Row(
                            children: [
                              const SizedBox(width: 30),
                              SizedBox(
                                width: 225,
                                child: TextFormField(
                                  controller: _passwordController,
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return "Please Enter Password";
                                    }
                                    cpass = true;
                                  },
                                  onSaved: (val) => _username.text = val!,
                                  autocorrect: true,
                                  obscureText: true,
                                  style: const TextStyle(fontSize: 20),
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    prefixIcon: Icon(Icons.lock),
                                    labelText: 'Password',
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              TextButton.icon(
                                onPressed: () => _settings(),
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 144, 145, 72),
                                ),
                                label: const ConfigText("Change",
                                    Color.fromARGB(255, 255, 255, 255), 20),
                                icon: const Icon(Icons.change_circle,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(height: 50),
                          Row(
                            children: [
                              const SizedBox(width: 30),
                              SizedBox(
                                width: 225,
                                child: TextFormField(
                                  controller: _confpass,
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return "Please Enter ConfirmPassword";
                                    }
                                    if (_confpass.text !=
                                        _passwordController.text) {
                                      return "Password Does't Match";
                                    }
                                    ccpass = true;
                                  },
                                  onSaved: (val) => _username.text = val!,
                                  autocorrect: true,
                                  obscureText: true,
                                  style: const TextStyle(fontSize: 20),
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          borderSide: BorderSide(
                                              style: BorderStyle.solid,
                                              color: Color.fromARGB(
                                                  226, 114, 145, 0))),
                                      prefixIcon: Icon(Icons.lock),
                                      labelText: 'ConfirmPassword',
                                      labelStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ),
                              const SizedBox(width: 20),
                              TextButton.icon(
                                onPressed: () => _settings(),
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 144, 145, 72),
                                ),
                                label: const ConfigText("Change",
                                    Color.fromARGB(255, 255, 255, 255), 20),
                                icon: const Icon(Icons.change_circle,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                      // Column(
                      //   children: [
                      //     ElevatedButton.icon(
                      //       onPressed: () => _settings(),
                      //       style: TextButton.styleFrom(
                      //         backgroundColor:
                      //             const Color.fromARGB(255, 144, 145, 72),
                      //       ),
                      //       label: const ConfigText("Change",
                      //           Color.fromARGB(255, 255, 255, 255), 35),
                      //       icon: const Icon(Icons.change_circle,
                      //           color: Colors.white),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
