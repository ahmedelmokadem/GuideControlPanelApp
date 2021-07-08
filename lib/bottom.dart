import 'package:flutter/material.dart';
import 'main.dart';
import 'home.dart';
import 'edititem.dart';
import 'message.dart';

class bottom extends StatefulWidget {
  @override
  _bottomState createState() => _bottomState();
}

class _bottomState extends State<bottom> {
  int _selectedIndex =0 ;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(

      child: Row(
        mainAxisAlignment:  MainAxisAlignment.spaceAround,

        children: [

          InkWell(
            child:Icon(Icons.home,size: 40,color: Colors.deepOrange,),
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
            },
          ),

          InkWell(child: Icon(Icons.email,size: 40,),
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>message()));

            },),
          InkWell(child:Icon(Icons.edit,size: 40,color: Colors.deepOrange,),
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>edititem()));

            },),
          InkWell(
            child:Icon(Icons.add_shopping_cart,size: 40,),
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
            },
          ),

        ],
      ),
    );
  }
}
