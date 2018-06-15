import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Feed extends StatelessWidget {
  List data;

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
        headers: {
          "Accept": "application/json"
        }
    );


    data = JSON.decode(response.body);

    print(data[1]["title"]);
  }

  @override
  Widget build(BuildContext context) => new Container(
    child: new ListView.builder(
      itemCount: data == null ? 0 : data.length,
      itemBuilder: (BuildContext context, int index) {
        return new Card(
          child: new Text(data[index]["title"]),
        );
      },
    ),
  );
}
