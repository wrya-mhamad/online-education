// ignore: file_name

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Resources extends StatefulWidget {
  const Resources({Key? key}) : super(key: key);

  @override
  _ResourcesState createState() => _ResourcesState();
}

class _ResourcesState extends State<Resources> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        leading:Icon(Icons.arrow_back,),
        
        title: Text("Resources"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black,
        child: Icon(Icons.edit),
      ),
      body: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 300,
            margin: EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.green,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(5, 5), color: Colors.grey, blurRadius: 10),
                  BoxShadow(
                      offset: Offset(-5, -5),
                      color: Colors.grey,
                      blurRadius: 10)
                ]),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      "https://www.itsolutions-inc.com/assets/uploads/news/MS_word_logo_fillable_forms_larger.jpg",
                      width: 80,
                      height: 60,
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 2,color: Colors.green),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Row(
                        children: [
                          IconButton(onPressed: () {},icon: Icon(Icons.add,color: Colors.green,),),
                          Text("Add attachment",style: TextStyle(color: Colors.green),),
                          IconButton(onPressed: () {},icon: Icon(Icons.highlight_off,color: Colors.green,),),

                        ],
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(40),
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.green,width: 2)),
                    enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.green,width: 2)),

                    label: Text("Add to Post",style: TextStyle(fontWeight: FontWeight.bold),),
                    suffixIcon: Icon(Icons.send),
                  ),
                ),
              )
            ]),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(primary: Colors.amber,shape: new RoundedRectangleBorder(
               borderRadius: new BorderRadius.circular(30.0)),),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
                  child: Text("Submit",style: TextStyle(fontSize: 30,color: Colors.black),),
                )),
          )
        ],
      ),
    );
  }
}
