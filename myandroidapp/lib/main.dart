import 'package:flutter/material.dart';
import 'Fitness_files/flexibilty_essentials.dart';
import 'NavBar.dart';
import 'SecondScreen.dart';
import 'Settings.dart';
import 'home_page.dart';
import 'sticky_notes.dart';

void main() => runApp(MaterialApp(home: HomePage()));

class LoginPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  String name = "";
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Container(
      child: Scaffold(
        key: _scaffoldKey,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('black.jpg'),
                fit: BoxFit.cover,
              )),
          // decoration: BoxDecoration(color: Colors.black),
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05,
                  bottom: MediaQuery.of(context).size.height * 0.05),
              decoration: BoxDecoration(color: Color(0xFF212121)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9, //aspect ratio for Image
                    child: Image(
                      image: AssetImage('logo1.png'),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Text("Login Page",
                      style: TextStyle(fontSize: 25, color: Colors.white)),
                  SizedBox(height: height * 0.04),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.05,
                        0,
                        MediaQuery.of(context).size.width * 0.05,
                        0),
                    padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.03,
                      0,
                      MediaQuery.of(context).size.width * 0.03,
                      MediaQuery.of(context).size.height * 0.01,
                    ),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      // style: const TextStyle(color: Colors.white),
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.white),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color.fromRGBO(2, 180, 123, 1))),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color.fromRGBO(2, 180, 123, 1))),
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                .hasMatch(value)) {
                          return "Enter Correct Email";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.05,
                        0,
                        MediaQuery.of(context).size.width * 0.05,
                        0),
                    padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.03,
                      0,
                      MediaQuery.of(context).size.width * 0.03,
                      MediaQuery.of(context).size.height * 0.01,
                    ),
                    child: TextFormField(
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.white),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color.fromRGBO(2, 180, 123, 1))),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color.fromRGBO(2, 180, 123, 1))),
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[a-z A-z]+$').hasMatch(value)) {
                          return "Enter Correct Password";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.2),
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromRGBO(2, 180, 123, 1)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            )),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SecondScreen()),
                            );
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.2),
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromRGBO(2, 180, 123, 1)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            )),
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              final snackBar =
                              SnackBar(content: Text("submitted"));
                              _scaffoldKey.currentState!.showSnackBar(snackBar);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                              );
                            }
                          },
                          child: Text(
                            'Confirm',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
