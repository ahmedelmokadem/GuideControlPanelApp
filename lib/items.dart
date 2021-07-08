import 'package:flutter/material.dart';
import 'drawer.dart';
import 'viewitemcategory.dart';

class items extends StatefulWidget {
  @override
  _itemsState createState() => _itemsState();
}

class _itemsState extends State<items> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepOrange,),
      drawer: drawer(),
      body: ListView(
        children: [
          ListTile(
            tileColor: Colors.blueAccent,
            leading: Icon(Icons.all_inclusive,size: 35,),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Cafe and Restaurant',
                style: TextStyle(fontSize: 23),),
            ),
            onTap: () {
             Navigator.push(context, MaterialPageRoute(builder: (context)=>viewitemcategory(title :"cafe and restaurant")));

            },
          ),
          ListTile(
            tileColor: Colors.green,
            leading: Icon(Icons.add_shopping_cart,size: 35,),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Pharmacy',
                style: TextStyle(fontSize: 23),),
            ),
            onTap: () {
              //      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));

            },
          ),
          ListTile(
            tileColor: Colors.yellowAccent,
            leading: Icon(Icons.add_shopping_cart,size: 35,),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Market',
                style: TextStyle(fontSize: 23),),
            ),
            onTap: () {
              //      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));

            },
          ),
          ListTile(
            tileColor: Colors.white,
            leading: Icon(Icons.add_shopping_cart,size: 35,),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Clinic',
                style: TextStyle(fontSize: 23),),
            ),
            onTap: () {
              //      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));

            },
          ),
          ListTile(
            tileColor: Colors.lightGreen,
            leading: Icon(Icons.add_shopping_cart,size: 35,),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Football',
                style: TextStyle(fontSize: 23),),
            ),
            onTap: () {
              //      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));

            },
          ),
          ListTile(
            tileColor: Colors.indigo,
            leading: Icon(Icons.add_shopping_cart,size: 35,),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('play station',
                style: TextStyle(fontSize: 23),),
            ),
            onTap: () {
              //      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));

            },
          ),
          ListTile(
            tileColor: Colors.deepOrange,
            leading: Icon(Icons.add_shopping_cart,size: 35,),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Mobile shop',
                style: TextStyle(fontSize: 23),),
            ),
            onTap: () {
              //      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));

            },
          ),
          ListTile(
            tileColor: Colors.pinkAccent,
            leading: Icon(Icons.add_shopping_cart,size: 35,),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('play station',
                style: TextStyle(fontSize: 23),),
            ),
            onTap: () {
              //      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));

            },
          ),
          ListTile(
            tileColor: Colors.amber,
            leading: Icon(Icons.add_shopping_cart,size: 35,),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('play station',
                style: TextStyle(fontSize: 23),),
            ),
            onTap: () {
              //      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));

            },
          ),
          ListTile(
            tileColor: Colors.black12,
            leading: Icon(Icons.add_shopping_cart,size: 35,),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('play station',
                style: TextStyle(fontSize: 23),),
            ),
            onTap: () {
              //      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));

            },
          ),
          ListTile(
            tileColor: Colors.redAccent,
            leading: Icon(Icons.add_shopping_cart,size: 35,),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('play station',
                style: TextStyle(fontSize: 23),),
            ),
            onTap: () {
              //      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));

            },
          ),
          ListTile(
            tileColor: Colors.indigo,
            leading: Icon(Icons.add_shopping_cart,size: 35,),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('play station',
                style: TextStyle(fontSize: 23),),
            ),
            onTap: () {
              //      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));

            },
          ),


        ],
      ),
    );
  }
}
