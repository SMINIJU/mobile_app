import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class Homescreen extends StatefulWidget {
//  final String Username;
//
//  Homescreen(this.Username);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
//  final String Username;
//
//  _HomescreenState(this.Username);

  List userData;
  Map Data;

  Future getData() async {
    http.Response response = await http.get(
        "http://192.168.0.4:3000/api/PrincipalList");
    setState(() {
      userData;
    });
    if (response.statusCode == 200) {
      return userData = json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Welcome"),
          ),
          body: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(20),
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            children: [
              Container(
                child: InkWell(
                  child: Text(
                    "GRN REPORT",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
//                  onTap: () {
//                    Navigator.of(context).push(
//                      MaterialPageRoute(
//                        builder: (context) {
//                          return UserPrin(Username);
//                        },
//                      ),
//                    );
//                  },
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('Assets/stock.png'), fit: BoxFit.cover)),
              ),
              Container(
                child: InkWell(
                  child: Text(
                    "STOCK REPORT",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
//                  onTap: () {
//                    Navigator.of(context).push(
//                      MaterialPageRoute(
//                        builder: (context) {
//                          return UserPrin(Username);
//                        },
//                      ),
//                    );
//                  },
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('Assets/GRN.jpg'), fit: BoxFit.cover)),
              ),
              Container(
                child: InkWell(
                  child: Text(
                    "TRANSACTION REPORT",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
//                  onTap: () {
//                    Navigator.of(context).push(
//                      MaterialPageRoute(
//                        builder: (context) {
//                          return UserPrin(Username);
//                        },
//                      ),
//                    );
//                  },
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('Assets/Trans.png'), fit: BoxFit.cover)),
              ),
            ],
          ),
        ));
  }
}
