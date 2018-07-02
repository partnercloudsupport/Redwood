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
//    var response = await http.get(
//        Uri.encodeFull("https://raw.githubusercontent.com/isontic/data/master/tv.json"),
//        headers: {
//          "Accept": "application/json"
//        }
//    );
//
//    this.setState(() {
//      data = json.decode(response.body);
//
//
//    });
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
//    return new Scaffold(
//      body: new ListView.builder(
//        itemCount: data == null ? 0 : data.length,
//        itemBuilder: (BuildContext context, int index) {
//          URL() {
//            launch(data[1]["link"]);
//          }
//          return new Card(
//            child: new Column(
//              mainAxisSize: MainAxisSize.min,
//              children: <Widget>[
//                ListTile(
//                  leading: const Icon(Icons.tv),
//                  title: new Text(data[index]["title"])
//                ),
//                Stack(
//                  children: <Widget>[
//                    Center(child: CircularProgressIndicator()),
//                    Center(
//                      child: FadeInImage.memoryNetwork(
//                        placeholder: kTransparentImage,
//                        image: data[index]["body"],
//                      ),
//                    ),
//                  ],
//                ),
//                new ButtonTheme.bar( // make buttons use the appropriate styles for cards
//            child: new ButtonBar(
//            children: <Widget>[
//               new FlatButton(
//                 child: const Text('Watch'),
//                  onPressed: URL,
//               ),
//              ],
//              ),
//          ),
//              ],
//            ),
//          );
        return new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Icon(
                    Icons.tv,
                    size: 150.0,
                    color: Colors.black12
                ),
                new Text('Redwood TV Coming Soon!\n'),
                new Text('If you want to watch the latest episode tap on the button\n'),
                new RaisedButton(
                  child: const Text('Latest Episode'),
                  color: Color.fromARGB(170,255,0,0),
                  elevation: 4.0,
                  splashColor: Colors.blueGrey,
                  onPressed: TVE,
                ),
              ],
            );
//        },
//      ),
//    );
  }
}

TVE() {
  launch('https://www.tamdistrict.org/RedwoodTV');
}