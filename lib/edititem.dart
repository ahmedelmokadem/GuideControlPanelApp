import 'dart:io';
import 'drawer.dart';
import 'bottom.dart';
import 'home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'subitem.dart';


class edititem extends StatefulWidget {
   String doc,fullname,address,number,desc;
   edititem({this.doc,this.fullname,this.address,this.number,this.desc});

  @override
  _edititemState createState() => _edititemState();
}

class _edititemState extends State<edititem> {
  String profile = "", cover = "";
  Future getimage(String name)async
  {
    final image = await ImagePicker().getImage(source: ImageSource.gallery);
    if(image != null)
    {
      Reference ref = FirebaseStorage.instance.ref().child(name);
      await ref.putFile(File(image.path));
      String url = await ref.getDownloadURL();
      name=="0"?profile = url:cover = url;
      setState(() {});
    }
    else
    {
      print("no image");
      return null;
    }
  }

  TextEditingController fullname = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController number = TextEditingController();


  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size s =MediaQuery.of(context).size;
    double h=s.height,w=s.width;
    fullname.text=widget.fullname;
    address.text=widget.address;
    number.text=widget.number;
    desc.text=widget.desc;
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
                    controller: fullname,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      hintText: "  fullname",
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
                    controller: address,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      hintText: "  address",
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
                    controller: number,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      hintText: "  mobile",
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
                    controller: desc,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      hintText: "  desc",
                      border: InputBorder.none,
                    ),

                  )),
              SizedBox(height: h*0.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("images",style: TextStyle(fontSize: 20),),
                  SizedBox(width: w*0.02,),
                  RaisedButton(child: Text("upload profile"),onPressed:  () {getimage("0");}),
                  SizedBox(width: w*0.02,),
                  RaisedButton(child: Text("upload cover"),onPressed: () {getimage("1");})
                ],
              ),
              SizedBox(height: h*0.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Add subitem",style: TextStyle(fontSize: 20),),
                  SizedBox(width: w*0.02,),
                  RaisedButton(child: Text("Add"),onPressed:  () { Navigator.push(context, MaterialPageRoute(builder: (context)=>subitem(doc:widget.doc)));
                  }),
                  SizedBox(width: w*0.02,),
                  RaisedButton(child: Text("Sub Items"),onPressed:(){}),
                ],
              ),
              SizedBox(height: h*0.05,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  // RaisedButton(child: Text("Edit",style: TextStyle(fontSize: 25),),
                  //   onPressed: ()async{
                  //
                  //     await FirebaseFirestore.instance.collection('category').doc(name.text).({
                  //       'fullname' : fullname.text ,
                  //       'address' : address.text ,
                  //       'number' : number.text,
                  //       'desc': desc.text,
                  //      // 'photo': [profile, cover],
                  //
                  //
                  //     });
                  //     fullname.clear();
                  //     address.clear();
                  //     number.clear();
                  //     desc.clear();
                  //
                  //   },
                  //   color: Colors.deepOrange,padding: EdgeInsets.all(16.0),)
                ],
              )
            ],


          ),
        ),
      ),
      bottomNavigationBar: bottom(),
    );
  }
}
