import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Today extends StatelessWidget {

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

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("https://raw.githubusercontent.com/isontic/data/master/feed.json"),
        headers: {
          "Accept": "application/json"
        }
    );

    this.setState(() {
      data = json.decode(response.body);
    });
    print(data[1]["title"]);
    print(data[1]["body"]);
    print(data[1]["img"]);

    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  String nextclassstart = '5';

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Text('\n'),
        new Card(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new ListTile(
                title: new Text('Your Next Class Starts in ' + nextclassstart +  ' minutes'),
              ),

            ],
          ),
        ),
        new Divider(height: 10.0,color: Colors.grey,),
      ],
    );
  }


}
