import 'package:app/Pages/MainPage.dart';
// import 'package:app/Pages/Features.dart';
import 'package:flutter/material.dart';
import 'package:app/Pages/Signup.dart';
import 'package:sqflite/sqflite.dart';
import 'TextConfig.dart';
import 'package:app/Extras/comHelper.dart';
import 'package:app/DB/DBConnection.dart';

bool ispressed = false;
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final _formkey = new GlobalKey<FormState>();
var dbhelper = DatabaseHelper();
String email = _emailController.text;

class ColorConfigs extends StatefulWidget {
  const ColorConfigs({super.key});
  @override
  State<ColorConfigs> createState() {
    return _colorconfigState();
  }
}

class _colorconfigState extends State<ColorConfigs> {
  bool cemail = false;
  bool cpass = false;
  bool correctdata = false;
  String missingemail = "Email";
  String missingpass = "Password";
  String email = "", pass = "";
  void signupbot() {
    setState(() {
      missingemail = "Email";
      missingpass = "Password";

      Navigator.push(
          context, MaterialPageRoute(builder: ((_) => const SignUp())));
    });
  }

  void _login(BuildContext context) async {
    String email = _emailController.text;
    String password = _passwordController.text;
    if (cemail && cpass) {
      correctdata = true;
    }
    final form = _formkey.currentState;
    if (form != null && !form.validate()) {
      alertDialog(context, "Please Enter Email");
      alertDialog(context, "Please Enter Password");
    } else {
      if (correctdata) {
        cemail = false;
        cpass = false;
        // _emailController.text = "";
        // _passwordController.text = "";
        correctdata = false;
        Database db = await DatabaseHelper.instance.database;
        List<Map> result = await db.query(
          'Users',
          where: 'Email = ? AND Password = ?',
          whereArgs: [email, password],
        );

        if (result.isNotEmpty) {
          // Login successful, proceed to next screen
          Navigator.push(
              context, MaterialPageRoute(builder: ((_) => const Mainpage())));
        } else {
          // Invalid credentials, show an error message
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text(
                'Error !',
                style: TextStyle(fontSize: 30),
              ),
              content: Text(
                'Invalid email or password. Please Try Again',
                style: TextStyle(fontSize: 20),
              ),
              actions: [
                TextButton(
                  child: Text('OK'),
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
    email = _emailController.text;
    pass = _passwordController.text;
    return SingleChildScrollView(
        child: Form(
            key: _formkey,
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              children: [
                //upper Part
                const SizedBox(height: 80),
                Row(
                  children: [
                    const SizedBox(width: 125),
                    const Text(
                      "SVIG",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 31, 37, 68),
                          fontSize: 50,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 10),
                    Image.asset(
                      "assets/images/dice-3.png",
                      width: 50,
                      color: const Color.fromARGB(255, 31, 37, 68),
                    ),
                  ],
                ),
                //medium Part
                const SizedBox(height: 100),
                Column(
                  children: [
                    const SizedBox(width: 30),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      margin: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        controller: _emailController,
                        obscureText: false,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return "Please Enter Email";
                          }
                          if (!validateEmail(val)) {
                            return "Please Enter Valid Email Formate";
                          }
                          cemail = true;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(60)),
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Color.fromARGB(226, 114, 145, 0))),
                          prefixIcon: Icon(Icons.mail),
                          labelText: "Email",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: const TextStyle(fontSize: 20),
                        cursorColor: const Color.fromARGB(225, 31, 37, 68),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      margin: const EdgeInsets.only(top: 5),
                      child: TextFormField(
                        controller: _passwordController,
                        autocorrect: true,
                        obscureText: true,
                        style: const TextStyle(fontSize: 20),
                        keyboardType: TextInputType.text,
                        cursorColor: const Color.fromARGB(225, 31, 37, 68),
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return "Please Enter Password";
                          }
                          cpass = true;
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(60)),
                                borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Color.fromARGB(226, 114, 145, 0))),
                            prefixIcon: Icon(Icons.lock),
                            labelText: "Password",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => _login(context),
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 31, 37, 68),
                      ),
                      label: const ConfigText(
                          "Login", Color.fromARGB(255, 255, 208, 236), 35),
                      icon: const Icon(Icons.login_outlined,
                          color: Color.fromARGB(255, 255, 208, 236), size: 35),
                    ),
                    const SizedBox(height: 80),
                    Row(
                      children: [
                        const SizedBox(width: 30),
                        const Text(
                          "don't have account ?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 31, 37, 68),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 15),
                        ElevatedButton(
                          onPressed: signupbot,
                          style: TextButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 31, 37, 68),
                          ),
                          child: const ConfigText(
                              "Signup", Color.fromARGB(255, 255, 208, 236), 25),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )));
  }
}
