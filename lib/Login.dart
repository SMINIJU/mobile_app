import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mobile_app/customfile.dart';
import 'package:mobile_app/homePage.dart';

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
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomRight,
              widthFactor: 0.6,
              heightFactor: 0.6,
              child: Material(
                borderRadius: BorderRadius.all(Radius.circular(200.0)),
                color: Color.fromRGBO(255, 255, 255, 0.4),
                child: Container(
                  width: 400,
                  height: 400,
                ),

              ),
            ),
            Align(
              alignment: Alignment.topRight,
              widthFactor: 0.3,
              heightFactor: 0.2,

                child: Center(
                  child: Material(
                    borderRadius: BorderRadius.all(Radius.circular(150.0)),
                    color: Color.fromRGBO(256, 253, 223, 0.4),
                    child: Container(
                    width: 300,
                    height: 300,


                  ),


                ),
              ),
            ),



            Center(
                child: Container(
                  width: 400,
                  height: 400,
//           color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Material(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          child:Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:Image.asset('images/ex.png',width: 60,height: 60,),
                          )),
                      custom(
                        validate: (user) => user.isEmpty ? "Please Enter username" : null,
                          fieldicon: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          user: "Username"),
                      custom(
                          validate: (pwd)=> pwd.isEmpty ? "Please Enter username" : null,
                          fieldicon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),

                          user: "Password"),
                      Container(
                        width: 150,
                        height: 50,
                        child: RaisedButton(
                          onPressed: () {
                            if(_formkey.currentState.validate()  ){
                               Homescreen();
                            }
                          },
                          color: Colors.deepOrange,
                          shape: RoundedRectangleBorder(
                              side: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      )

                    ],
                  ),
                )
            ),

          ],
        ),
      ),
    );
  }
}
