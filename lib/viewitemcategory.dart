import 'package:flutter/material.dart';
import 'drawer.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'edititem.dart';

class viewitemcategory extends StatefulWidget {
  String title ;
  viewitemcategory ({this.title});
  @override
  _viewitemcategoryState createState() => _viewitemcategoryState();
}

class _viewitemcategoryState extends State<viewitemcategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepOrange,),
      drawer: drawer(),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('category').where("category", isEqualTo: widget.title).snapshots(),
        builder: (context, snapshot){
          if (!snapshot.hasData) {return Container();}
          else {
          return ListView.builder(
            itemCount: snapshot.data.size,
            itemBuilder: (context, index){
              return Card(
                child: ListTile(
                 leading: CircleAvatar(backgroundImage: NetworkImage(snapshot.data.docs[index]["photo"][0]),),
                 title: Text(snapshot.data.docs[index]["fullname"]),
                   subtitle: Text(snapshot.data.docs[index]["desc"]),
                   trailing: Wrap(children: [
                     IconButton(icon: Icon(Icons.edit), onPressed: (){
                       Navigator.push(context, MaterialPageRoute(
                           builder: (context)=>edititem(doc:snapshot.data.docs[index].id,
                             fullname :snapshot.data.docs[index]["fullname"],
                             address :snapshot.data.docs[index]["address"],
                             number :snapshot.data.docs[index]["number"],
                             desc :snapshot.data.docs[index]["desc"],
                           )));

                     },),
                     IconButton(icon: Icon(Icons.delete), onPressed: ()async{
                       await FirebaseFirestore.instance.collection("category").doc(snapshot.data.docs[index].id).delete();
                     },),
                   ],),

                ),
              );
            },


          );}
        },
      ),
    );
  }
}
