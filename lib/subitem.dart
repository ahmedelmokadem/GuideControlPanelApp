import 'package:flutter/material.dart';
import 'drawer.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

String url = "";

class subitem extends StatefulWidget {
  String doc;
  subitem({this.doc});
  @override
  _subitemState createState() => _subitemState();
}

class _subitemState extends State<subitem> {
  Future getimage(String name)async
  {
    final image = await ImagePicker().getImage(source: ImageSource.gallery);
    if(image != null)
    {
      Reference ref = FirebaseStorage.instance.ref().child("${widget.doc}/items/$name");
      await ref.putFile(File(image.path));
      url = await ref.getDownloadURL();
      setState(() {});
    }
    else
    {
      print("no image");
      return null;
    }
  }
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size s =MediaQuery.of(context).size;
    double h=s.height,w=s.width;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepOrange,),
      drawer: drawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: h*0.02,),

              Container(
                //  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  width: w*0.8,
                  decoration: BoxDecoration(
                      color: Colors.orange[100],
                      borderRadius: BorderRadius.circular(29)
                  ),
                  child: TextField(
                    controller: name,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      hintText: "  name",
                      border: InputBorder.none,
                    ),

                  )),
              SizedBox(height: h*0.02,),
              Container(
                //  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  width: w*0.8,
                  decoration: BoxDecoration(
                      color: Colors.orange[100],
                      borderRadius: BorderRadius.circular(29)
                  ),
                  child: TextField(
                    controller: price,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      hintText: "  price",
                      border: InputBorder.none,
                    ),

                  )),
              SizedBox(height: h*0.02,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("images",style: TextStyle(fontSize: 20),),
                  SizedBox(width: w*0.02,),
                  RaisedButton(child: Text("upload profile"),onPressed:  () {getimage(name.text);setState(() {
                  });}),
                ],
              ),
              SizedBox(height: h*0.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Add subitem",style: TextStyle(fontSize: 20),),
                  SizedBox(width: w*0.02,),
                  RaisedButton(child: Text("Add"),onPressed:  ()async {
                    await FirebaseFirestore.instance.collection('category').doc(widget.doc).update({
                      "subitem" : FieldValue.arrayUnion([{"name" : name.text , "price" : price.text, "photo": url}]) ,
                    });
                    name.clear();
                    price.clear();
                  }),
                ],
              ),
              SizedBox(height: h*0.05,),
            ],


          ),
        ),
      ),
    );
  }
}
