import 'package:flutter/material.dart';
import 'bottom.dart';
import 'drawer.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  int length = 0;
  int mes = 0;
  int totitem=1;
  @override
  Widget build(BuildContext context) {
    Size s =MediaQuery.of(context).size;
    double h=s.height,w=s.width;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepOrange,),
      drawer: drawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add_shopping_cart),
                SizedBox(width: w*0.02,),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection("category").snapshots(),
                  builder: (context, snapshot) {
                    if(!snapshot.hasData){
                      return Container();
                    }
                    else {
                      return Text("Total Items :    " + snapshot.data.docs.length.toString(),
                        style: TextStyle(fontSize: 20),);
                    }
                  }
                ),
              ],
            ),
            SizedBox(height: h*0.08,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.email),
                SizedBox(width: w*0.02,),
                Text("Messages :    " + mes.toString(), style: TextStyle(fontSize: 20),),
              ],
            ),
          ],

        ),
      ),
      bottomNavigationBar: bottom(),


    );
  }
}
