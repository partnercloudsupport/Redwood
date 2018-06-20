import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class Tv extends StatelessWidget {

  @override
  Widget build(BuildContext context) => new Container(
    child: new HomePage(),
  );
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

  List data;
  List data2;

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("https://raw.githubusercontent.com/EliasDeuss/data/master/tv.json"),
        headers: {
          "Accept": "application/json"
        }
    );

    this.setState(() {
      data = json.decode(response.body);


    });
    print(data[1]["title"]);
    print(data[1]["body"]);

    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.menu),
                  title: new Text(data[index]["title"])
                ),
                Image.network(data[index]["body"])
              ],
            ),
          );
        },
      ),
    );
  }
}