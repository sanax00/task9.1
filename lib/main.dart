import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  initState(){

    super.initState();
  }
SaveData(String a) async{
var pref = await SharedPreferences.getInstance();
pref.setString("key1", "$a");

}
GetData() async{
  var pref = await SharedPreferences.getInstance();
  var s=pref.getString("key1")??"no";
  return s;
}
DeleteData() async{
    var pref = await SharedPreferences.getInstance();
    pref.remove("key1");
}

  TextEditingController myname = new TextEditingController();
  String? s;
  @override
  Widget build(BuildContext context) {




    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
       child: Column(
         children: [
           Container(
             child: TextFormField(
               controller: myname,
               decoration: InputDecoration(
                   border: UnderlineInputBorder(),
                   labelText: 'Enter your Name'
               ),
             ),
           ),
           SizedBox(height: 10),
           Container(
             child: FlatButton(
             child: Text('Save Data', style: TextStyle(fontSize: 20.0),),
             color: Colors.blueAccent,
             textColor: Colors.white,
             onPressed: () {
               SaveData(myname.text);
               setState(() {

               });
             },
           ),

           ),
           SizedBox(height: 10),
           Container(
             child: FlatButton(
               child: Text('Read Data', style: TextStyle(fontSize: 20.0),),
               color: Colors.blueAccent,
               textColor: Colors.white,
               onPressed: ()
               async
               {

                 s=await GetData();
                 setState(() {

                 });
               },
             ),

           ),
           SizedBox(height: 10),
           Container(
              child: Text(
    "Hello, ${s??"noname"}",
    textAlign: TextAlign.center,
    overflow: TextOverflow.ellipsis,
    style: const TextStyle(fontWeight: FontWeight.bold),
    )

           ),
           SizedBox(height: 10),
           Container(
             child: FlatButton(
               child: Text('Delete Data', style: TextStyle(fontSize: 20.0),),
               color: Colors.blueAccent,
               textColor: Colors.white,
               onPressed: ()
               async
               {

                 await DeleteData();
                 s="Noname";
                 setState(() {

                 });
               },
             ),

           ),

         ],
       )






        ),


    );
  }
}
