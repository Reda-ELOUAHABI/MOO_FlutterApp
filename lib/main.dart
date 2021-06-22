import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
//   List gogle =[];
//   var url='https://random-data-api.com/api/omniauth/google_get';
//  initState(){
//    super.initialState();
//    this.fetchData(); }

//  Future fetchData() async{
//    final http.Response res = await http.get(url);
//    final data = json.decode(res.body);
//    setState( () {
//      this.gogle = data['results'];
//    });

//  }
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Welcome to Air conseil'),
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
  dynamic data;
  String data1 = "Hi";
  int i = 0;
  void _search() {
    String url = 'http://172.16.1.203:4000/';
    print(url);
    http.get(Uri.parse(url)).then((response) {
      setState(() {
        this.data = json.decode(response.body);
        data1 = data.toString();
        data1 = data1.split(" ")[i].toString();
        print(data["nom"]);
        i++;
        if(i==5){
          i=0;
        }
        print(i);
      });
      // print(data[0]);
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello World',
            ),
            FloatingActionButton(onPressed: () {
              setState(() {
                _search();
              });
            }),
            Text(
              data1,
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
