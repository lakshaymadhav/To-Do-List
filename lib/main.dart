import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home:MyStatefulWidget(),
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Colors.lime,
        brightness: Brightness.dark,
      ),
     )
    );
}

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}



class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String input="";
  List list=List();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    list.add("Welcome to To-Do List");
    list.add("Use the + Button to Add an Entry to the List ");
    list.add("Swipe Right to delete an Entry in the list");
    list.add("New Features coming on!!");
    list.add("To Request a feature, Ping me on ");
    list.add("Email: lakshaymadhav25@gmail.com");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("To-Do List",textDirection: TextDirection.ltr, ), 
        ),
        
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add) ,
          onPressed: (){
            showDialog(
              context: context,
              builder: (BuildContext context){
                return AlertDialog(
                  title: Text("Add New List"),
                  content: TextField(
                    onChanged: (String value){
                      input = value; 
                    },
                  ),
                  actions: <Widget>[
                    RaisedButton(
                      child: Text("Add"),
                      color: Colors.blue[300],
                      onPressed: (){
                        setState(() {
                          list.add(input); 
                        });
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
        ), 
        body: ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context,int index) {
              return Padding(
                padding: EdgeInsets.only(top:5.0,left: 5.0,right: 5.0),
                child: Card(
                        child: Dismissible(
                    key: Key(list[index]),
                    
                    child:ListTile(
                      title: Text(list[index])
                    ),
                    onDismissed: (direction){
                      setState(() {
                        list.removeAt(index);
                      });
                    },   
                  ),
                 ),
              );
            } ,
          ), 
    );
     
  }
}