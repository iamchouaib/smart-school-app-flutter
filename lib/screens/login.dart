import 'dart:convert';
import 'package:chouaibe/header_widget.dart';
import 'package:chouaibe/model/api.dart';
import 'package:chouaibe/screens/register.dart';
import 'package:chouaibe/screens/switching.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class connexion extends StatefulWidget {
  const connexion({Key? key}) : super(key: key);

  @override
  State<connexion> createState() => _connexionState();
}

class _connexionState extends State<connexion> {
  double _headerHeight = 250;
  bool _passwordVisible = false;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(
                  _headerHeight, true), //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(
                      20, 10, 20, 10), // This will be the login form
                  child: Column(
                    children: [
                      Text(
                        "Smart school",
                        // style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 30, 64, 175)),
                      ),
                      Text(
                        "جميع معلومات ابنائك في حساب واحد",
                        style: TextStyle(color: Colors.grey),
                      ),

                      SizedBox(height: 30.0),

                      // key: _formKey,
                      Column(
                        children: [
                          Container(
                              child: TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: emailController,
                                  decoration: //ThemeHelper().textInputDecoration('User Name', 'Enter your user name'),
                                      InputDecoration(
                                    labelText: "الإيميل",
                                    hintText: " ادخل الايميل لطفا",
                                    fillColor: Colors.white,
                                    filled: true,
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(
                                          top: 0), // add padding to adjust icon
                                      child: Icon(Icons.email),
                                    ),
                                    contentPadding:
                                        EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 30, 64, 175))),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400)),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 2.0)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 2.0)),
                                  )),
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 20,
                                  offset: const Offset(0, 5),
                                )
                              ])),
                          SizedBox(height: 30.0),
                          Container(
                            child: TextField(
                                obscureText: !_passwordVisible,
                                controller: passwordController,
                                decoration: InputDecoration(
                                  labelText: 'كلمة السر ',
                                  hintText: "ادخل كلمة المرور لطفا ",
                                  fillColor: Colors.white,
                                  filled: true,
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(
                                        top: 0), // add padding to adjust icon
                                    child: Icon(Icons.key),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                        _passwordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: _passwordVisible
                                            ? Theme.of(context).primaryColorDark
                                            : Colors.grey),
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 30, 64, 175))),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade400)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 2.0)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 2.0)),
                                )),
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 20,
                                offset: const Offset(0, 5),
                              )
                            ]),
                          ),
                          SizedBox(height: 55.0),
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 30, 64, 175),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0)
                              ],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(255, 30, 64, 175)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                child: Text(
                                  "تسجيل الدخول ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              onPressed: () {
                                log_in();
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                            //child: Text('Don\'t have an account? Create'),
                            child: Text.rich(TextSpan(children: [
                              TextSpan(text: "انضم الينا ؟"),
                              TextSpan(
                                text: "حساب جديد ",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RegistrationPage()));
                                  },
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 30, 64, 175)),
                              ),
                            ])),
                          ),
                        ],
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  void log_in() async {
    if (passwordController.text.isNotEmpty && emailController.text.isNotEmpty) {
      var data = {
        'email': emailController.text,
        'password': passwordController.text
      };

      var response = await Api().postData(data, '/login');

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);

        print('THE ID' + body['user']['id'].toString());
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString('id', json.encode(body['user']['id'].toString()));

        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("enregistrer : ${body['user']['name']}")));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => switching_page()));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("معلومات خاطئة !")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Blank value is found")));
    }
  }
}
