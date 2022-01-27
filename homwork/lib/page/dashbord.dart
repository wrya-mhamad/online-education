// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homwork/page/home.dart';
import 'package:provider/provider.dart';

import '../model/user_model.dart';
import '../server/server_auth.dart';

class Dashbord extends StatefulWidget {
  const Dashbord({Key? key}) : super(key: key);

  @override
  _DashbordState createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord> {

User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Class"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(136, 111, 241, 207),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                await Provider.of<Server_auth>(context, listen: false)
                    .logout_system();
                        Navigator.pushNamed(context, '/');
               
              },
              icon: Icon(Icons.logout))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      drawer: Drawer(
        child: ListView(
          children: [DrawerHeader(child: Text("Wellcom"))],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(Provider.of<Server_auth>(context, listen: true).theUser !=
                    null
                ? Provider.of<Server_auth>(context, listen: true).theUser!.email!
                : 'no user'),
                Text("your name is ${loggedInUser.firstName} ${loggedInUser.secondName}"),
              Text("your name is "),
          ],
        ),
      ),
    );
  }
}
