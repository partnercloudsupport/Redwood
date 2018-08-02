import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:connectivity/connectivity.dart';
import 'package:native_ui/native_ui.dart';

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
  String _connectionStatus = 'Unknown';
  final Connectivity _connectivity = new Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  List data;

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull(
            "https://raw.githubusercontent.com/isontic/data/master/tv.json"),
        headers: {"Accept": "application/json"});

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

    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      setState(() => _connectionStatus = result.toString());
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<Null> initConnectivity() async {
    String connectionStatus;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      connectionStatus = (await _connectivity.checkConnectivity()).toString();
    } on PlatformException catch (e) {
      print(e.toString());
      connectionStatus = 'Failed to get connectivity.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return;
    }

    setState(() {
      _connectionStatus = connectionStatus;
    });
  }

  void playYoutubeVideo() {
    FlutterYoutube.playYoutubeVideoByUrl(
      apiKey: "AIzaSyCjfc_8iJx3H1hw8ZN3J06tkKRy2lIOQks",
      videoUrl: data[0]["link"],
    );
  }

  VidURL() {
    launch(data[0]["link"]);
  }

  @override
  Widget build(BuildContext context) {
    if (_connectionStatus == 'ConnectivityResult.wifi' ||
        _connectionStatus == 'Unknown' ||
        _connectionStatus == 'ConnectivityResult.mobile') {
      return new Scaffold(
          body: new ListView.builder(
              itemCount: data == null ? 0 : data.length,
              itemBuilder: (BuildContext context, int index) {
                return new Card(
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                          leading: const Icon(Icons.tv),
                          title: new Text(data[index]["title"])),
                      new Text('$_connectionStatus'),
                      new Container(
                        width: 370.0,
                        height: 200.0,
                        child: Stack(
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
                      ),
                      new ButtonTheme.bar(
                        // make buttons use the appropriate styles for cards
                        child: new ButtonBar(
                          children: <Widget>[
                            new PlatformSwitcher(
                              iOSChild: new FlatButton(
                                child: const Text('Watch'),
                                onPressed: VidURL,
                              ),
                              androidChild: new FlatButton(
                                child: const Text('Watch'),
                                onPressed: playYoutubeVideo,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }));
    }
    ;
    if (_connectionStatus == 'ConnectivityResult.none') {
      return new ListView(
        children: <Widget>[
          new Column(
            children: <Widget>[
              new Card(
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new ListTile(
                      title: new Text('No Internet'),
                      subtitle: new Text(
                        'Connect to the internet to watch Redwood TV',
                        style: new TextStyle(
                            color: Colors.grey.withOpacity(0.9),
                            fontSize: 12.0),
                      ),
                    ),
                    new Text('\n')
                  ],
                ),
              ),
            ],
          )
        ],
      );
    }
  }
}
