// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unnecessary_new

import 'package:flutter/material.dart';
import 'package:homwork/services/auth_service.dart';
import 'package:provider/provider.dart';

class LoginScreenView extends StatefulWidget {
  const LoginScreenView({Key? key}) : super(key: key);

  @override
  _LoginScreenViewState createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {
  AuthService _AuthService = AuthService();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool isChecked = false;
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
          key: _formKey,
          child: ListView(
            
            children: [
              Center(
                child: Text(
                  "LOGIN ",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(onPressed: (){
                Navigator.pushNamed(context, '/');
              }, child: Text("Change you job",style: TextStyle(fontSize: 24,color: Colors.red),)),
              testField("Email", _email,false, RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]"), "email",),
              testField("Password", _password,true,RegExp(r'^.{6,}$'),
                  "Password(Min. 6 Character)"),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Text("Remember me"),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: TextButton(
                        onPressed: () {}, child: Text("Forget password?")),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                   if (_formKey.currentState!.validate()) {
                       setState(() {
                      password = _password.value.text;
                      email = _email.value.text;
                    });
                    email = email.trim(); //remove spaces
                    email = email.toLowerCase();
                    await Provider.of<AuthService>(context, listen: false)
                        .login_sytelm(email, password);
                    Navigator.pushNamed(context, '/dashbord');
                    }
                   
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.yellow,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 65, right: 65),
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don’t have account? "),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1.0, color: Colors.black),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(5, 5), color: Colors.grey, blurRadius: 5)
                  ],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network(
                      "https://pbs.twimg.com/profile_images/1455185376876826625/s1AjSxph_400x400.jpg",
                      width: 40,
                    ),
                    Text(
                      "sign in with google",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding testField(String name, TextEditingController _controller,bool _obs, RegExp regex, String validate) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        controller: _controller,
        obscureText: _obs,
        decoration: InputDecoration(
          hintText: 'Enter your $name.',
          label: Text("Enter you $name"),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.yellow, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.yellow, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your $name");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid $validate");
          }
         
          return null;
        },
      ),
    );
  }
}
