import 'package:flutter/material.dart';
import 'drawer.dart';
import 'bottom.dart';
class message extends StatefulWidget {
  @override
  _messageState createState() => _messageState();
}

class _messageState extends State<message> {
  @override
  Widget build(BuildContext context) {
    Size s =MediaQuery.of(context).size;
    double h=s.height,w=s.width;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepOrange,),
      drawer: drawer(),
      body: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          Card(
            child: ListTile(
            title: Text("Name"),
              subtitle: Text("Message"),

            ),
          ),
          Card(
            child: ListTile(
              title: Text("Name"),
              subtitle: Text("Message"),

            ),
          ),

        ],
      ),
      bottomNavigationBar: bottom(),
    );
  }
}
