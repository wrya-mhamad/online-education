
// ignore_for_file: prefer_const_constructors
import 'package:homwork/page/dashbord.dart';
import 'package:homwork/page/home.dart';
import 'package:homwork/page/login_sysytem.dart';
import 'package:homwork/page/register_system.dart';
import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  const Index({ Key? key }) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      
      theme: ThemeData(
         fixTextFieldOutlineLabel: false,
         
          textTheme: TextTheme(bodyText1: TextStyle()),
          appBarTheme: AppBarTheme(
            // backgroundColor: Colors.red,
          )),
      initialRoute: '/',
      routes: {
        '/': (context) => Home_page(),
        '/login': (context) => Login_system(),
        '/register': (context) => Register_system(),
        '/dashbord': (context) => Dashbord(),
      },
    );
  }
}