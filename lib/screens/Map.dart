import 'package:flutter/material.dart';
import 'package:scalable_image/scalable_image.dart';

class Map extends StatelessWidget {
  @override
  Widget build (BuildContext context) => new Scaffold(

    //App Bar
    appBar: new AppBar(
      title: new Text(
        'Map',
        style: new TextStyle(
          fontSize: Theme.of(context).platform == TargetPlatform.iOS ? 17.0 : 20.0,
        ),
      ),
      elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
    ),

    //Content of tabs
    body: new CustomScrollView(
      primary: false,
      slivers: <Widget>[
        new SliverPadding(
          padding: const EdgeInsets.all(20.0),
          sliver: new SliverGrid.count(
            crossAxisSpacing: 1.0,
            crossAxisCount: 1,
            children: <Widget>[
              new SizedBox(
                width: 300.0,
                height: 200.0,
                child: new ScalableImage(
                    imageProvider: new AssetImage('Map1.png'),
                    dragSpeed: 4.0,
                    maxScale: 6.0
                ),
              ),
              new SizedBox(
                width: 300.0,
                height: 200.0,
                child: new ScalableImage(
                    imageProvider: new AssetImage('Map2.png'),
                    dragSpeed: 4.0,
                    maxScale: 6.0
                ),
              ),
              new SizedBox(
                width: 300.0,
                height: 200.0,
                child: new ScalableImage(
                    imageProvider: new AssetImage('Map3.png'),
                    dragSpeed: 4.0,
                    maxScale: 6.0
                ),
              ),
            ],
          ),
        ),
      ],
    )
  );
}



