import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text("Click Me ...!"),
            onPressed: (){
              printy();
            },
          ),
        ),
      ),
    );
  }
  void printy() async{
    String? value;

    MethodChannel _methodChannel = MethodChannel("com.flutter.epic/epic");
    var dataToPass = <String, dynamic>{
      "OS" : "Android"
    };

    try{
      value = await _methodChannel.invokeMethod<String>("printy",json.encode(dataToPass));
      print(value.toString());
    }
    catch (e){
      print(e.toString());
    }

  }
}
