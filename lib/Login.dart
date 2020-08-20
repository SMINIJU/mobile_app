import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  String username;
  String password;
  bool error = false;

  final _formkey = GlobalKey<FormState>();

  List<dynamic> userdata;

  Future datalogin() async {
    http.Response data =
        await http.get("http://192.168.0.4:3000/api/employees");
    userdata = json.decode(data.body);

    setState(() {
      userdata;
    });
    @override
    void initstate() {
      super.initState();
      datalogin();
    }

    return userdata;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.blue,
        child: Center(
            child: Container(
          width: 400,
          height: 400,
//           color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  width: 300,
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Colors.deepOrange,
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding:const EdgeInsets.all(8.0),
                        child:Icon(Icons.person,color: Colors.grey),
                      ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(10.0),bottomRight: Radius.circular(10.0))
                    ),
                      width: 250,
                    child:Padding(
                      padding:const EdgeInsets.all(8.0),

                    child: TextField(
                      decoration: InputDecoration(
                       // border: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepOrange)),
                        border: InputBorder.none,
                          hintText: "Enter Username",
                          fillColor: Colors.white, filled: true),
                      style: TextStyle(fontSize: 15, color: Colors.red),
                   ),
          )
                    )
                    ],
                  )
                  )
              )
            ],
          ),
        )),
      ),
    );
  }
}
