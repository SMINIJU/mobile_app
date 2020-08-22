import 'package:flutter/material.dart';
class custom extends StatelessWidget {
  Icon fieldicon;
  String user;
  Function validate;
  custom({this.fieldicon,this.user,this.validate});


  @override
  Widget build(BuildContext context) {
    return  Container(
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
                  child: fieldicon,
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10.0),bottomRight: Radius.circular(10.0))
                    ),
                    width: 250,
                    height: 55,
                    child:Padding(
                      padding:const EdgeInsets.all(8.0),

                      child: TextFormField(
//                        autovalidate: true,
                        decoration: InputDecoration(
                          // border: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepOrange)),
                            border: InputBorder.none,
                            hintText: user,
                            fillColor: Colors.white, filled: true,



                        ),
                       validator: validate,
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    )
                )
              ],
            )
        )
    );
  }
}
