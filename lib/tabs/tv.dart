import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
        Uri.encodeFull("https://raw.githubusercontent.com/isontic/data/master/tv.json"),
        headers: {
          "Accept": "application/json"
        }
    );

    this.setState(() {
      data = json.decode(response.body);


    });
    print(data[1]["title"]);
    print(data[1]["body"]);
    print(data[1]["link"]);

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

          _launchURL() async {
            String url = data[1]["link"];
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          }

          return new Card(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.tv),
                  title: new Text(data[index]["title"])
                ),
                Stack(
                  children: <Widget>[
                    Center(child: CircularProgressIndicator()),
                    Center(
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: data[index]["body"],
                      ),
                    ),
                  ],
                ),

          new ButtonTheme.bar( // make buttons use the appropriate styles for cards
            child: new ButtonBar(
            children: <Widget>[
               new FlatButton(
                 child: const Text('Watch'),
                  onPressed: _launchURL,
               ),
              ],
              ),
          ),
              ],
            ),
          );
        },
      ),
    );
  }
}