// import 'package:app/Pages/Features.dart';
import 'package:app/Pages/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:app/MainProgram/TextConfig.dart';
import 'package:app/DB/DBConnection.dart';
import 'package:app/Extras/comHelper.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  State<SignUp> createState() {
    return _signup();
  }
}

bool ispressed = false;

class _signup extends State<SignUp> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _confpass = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  var DBHelper = DatabaseHelper();
  String user = "", email = "", pass = "", confpass = "";
  bool cuser = false;
  bool cemail = false;
  bool cpass = false;
  bool ccpass = false;
  bool correctdata = false;

  void intialState() {
    super.initState();
    DBHelper = DatabaseHelper();
  }

  Future<void> _Signup(BuildContext context) async {
    String name = _username.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    if (cuser && cemail && ccpass && cpass) {
      correctdata = true;
    }
    final form = _formkey.currentState;
    if (form != null && !form.validate()) {
      alertDialog(context, "Please Enter UserName");
      alertDialog(context, "Please Enter Email");
      alertDialog(context, "Please Enter UserPassword");
      alertDialog(context, "Please Enter Confirmation Password");
    } else {
      if (correctdata) {
        _formkey.currentState!.save();
        cuser = false;
        cemail = false;
        cpass = false;
        ccpass = false;
        _username.text = "";
        _emailController.text = "";
        _passwordController.text = "";
        _confpass.text = "";
        correctdata = false;
        Map<String, dynamic> user = {
          'name': name,
          'email': email,
          'password': password,
        };
        int userId = await DatabaseHelper.instance.insertUser(user);
        if (userId != 0) {
          // Signup successful, proceed to the login screen
          Navigator.push(
              context, MaterialPageRoute(builder: ((_) => const Mainpage())));
        } else {
          // Display an error message if signup fails
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text(
                'Error !',
                style: TextStyle(fontSize: 30),
              ),
              content: const Text(
                'Failed to sign up. The Entered User May Exists',
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

  @override
  Widget build(BuildContext context) {
    user = _username.text;
    email = _emailController.text;
    pass = _passwordController.text;
    confpass = _confpass.text;
    return Scaffold(
      appBar: AppBar(
        //actionsIconTheme: Icon(Icons.arrow_back_ios_new_outlined),
        backgroundColor: const Color.fromARGB(255, 144, 145, 72),
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
                      const SizedBox(height: 10),
                      Image.asset(
                        "assets/images/dice-4.png",
                        width: 200,
                        color: const Color.fromARGB(255, 144, 145, 72),
                      ),
                      //medium Part
                      const SizedBox(height: 30),
                      Column(
                        children: [
                          SizedBox(
                            width: 350,
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
                                      BorderRadius.all(Radius.circular(60)),
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
                          const SizedBox(height: 10),
                          SizedBox(
                            width: 350,
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
                                      BorderRadius.all(Radius.circular(60)),
                                  borderSide: BorderSide(
                                      style: BorderStyle.solid,
                                      color: Color.fromARGB(255, 144, 145, 72)),
                                ),
                                prefixIcon: Icon(Icons.email),
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: 350,
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
                                      BorderRadius.all(Radius.circular(60)),
                                ),
                                prefixIcon: Icon(Icons.lock),
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: 350,
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
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(60)),
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
                          const SizedBox(height: 30),
                        ],
                      ),
                      Column(
                        children: [
                          ElevatedButton.icon(
                            onPressed: () => _Signup(context),
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 144, 145, 72),
                            ),
                            label: const ConfigText("SignUp",
                                Color.fromARGB(255, 255, 255, 255), 35),
                            icon: const Icon(Icons.account_circle_outlined,
                                color: Colors.white),
                          ),
                        ],
                      ),
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
