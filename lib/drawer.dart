import 'package:flutter/material.dart';
import 'dart:io';
import 'main.dart';
import 'home.dart';
import 'edititem.dart';
import 'message.dart';
import 'items.dart';


class drawer extends StatefulWidget {
  @override
  _drawerState createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    Size s =MediaQuery.of(context).size;
    double h=s.height,w=s.width;
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepOrange,
            ),
            child: Column(
              children: [
                //  'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/190322-ham-sandwich-horizontal-1553721016.png'
                Container(
                  // width: 500,
                  child: CircleAvatar(
                    maxRadius: 40,
                    backgroundImage: AssetImage('assets/Image/1.jpg'),
                  ),
                ),
                SizedBox(height: h*0.02,),
                Text('Admin',style: TextStyle(fontSize: 25),),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.all_inclusive,size: 35,),
            title: Text('Items',
              style: TextStyle(fontSize: 23),),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>items()));

            },
          ),  new Divider(
            thickness: 3,
            indent: 10,
            endIndent: 10,
          ),
          ListTile(
            leading: Icon(Icons.add_shopping_cart,size: 35,),
            title: Text('Add Item',
              style: TextStyle(fontSize: 23),),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));

            },
          ),
          ListTile(
            leading: Icon(Icons.edit,size: 35,),
            title: Text('Edit Item',
              style: TextStyle(fontSize: 23),),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>edititem()));
            },
          ),
          ListTile(
            leading: Icon(Icons.delete,size: 35,),
            title: Text('Delete Item',
              style: TextStyle(fontSize: 23),),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>edititem()));
            },
          ),


          new Divider(
            thickness: 3,
            indent: 10,
            endIndent: 10,
          ),

          ListTile(
            leading: Icon(Icons.message,size: 35,),
            title: Text('Message',
              style: TextStyle(fontSize: 23),),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>message()));
            },
          ),


          new Divider(
            thickness: 3,
            indent: 10,
            endIndent: 10,
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app,size: 35,),
            title: Text('Exit',
              style: TextStyle(fontSize: 23),),
            onTap: () {
              exit(0);
            },
          ),


        ],
      ),
    );
  }
}
