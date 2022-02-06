// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:homwork/page/dashbord.dart';
import 'package:homwork/services/auth_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<AuthService>(context, listen: true).theUser;
  return user != null ?Dashbord():
    Scaffold(
      
      body: Container(
        width: double.infinity,
        height: double.maxFinite,
        color: Color.fromARGB(255, 54, 198, 164),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Image.asset("assets/img/word.png",width: 200,color: Colors.white,)
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Center(
                  child: Text(
                "WELCOME!",
                style: TextStyle(fontSize: 34, color: Colors.white),
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 450.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      "who are you ?",
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
                  ),
                  button_method("Teacher",'/login'),
                  button_method("Student",'/login'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding button_method(String name,String _route) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, "$_route");
        },
        child: Container(
          width: 250,
          height: 65,
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(60),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 30),
              ),
              Icon(
                Icons.keyboard_arrow_right,
                size: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
