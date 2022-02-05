
// ignore_for_file: prefer_const_constructors
import 'package:homwork/page/dashbord.dart';
import 'package:homwork/page/home.dart';
import 'package:homwork/page/login_screen.dart';
import 'package:homwork/page/register_screen.dart';
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
        '/': (context) => HomePage(),
        '/login': (context) => LoginScreenView(),
        '/register': (context) => RegisterScreenView(),
        '/dashbord': (context) => Dashbord(),
      },
    );
  }
}