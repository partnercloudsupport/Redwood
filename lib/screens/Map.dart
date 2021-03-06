import 'package:flutter/material.dart';
import 'package:scalable_image/scalable_image.dart';
import 'package:flutter_villains/villain.dart';

class Map extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Scaffold(

      //App Bar
      appBar: new AppBar(
        title: new Text(
          'Redwood School Map'
        ),
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
                Villain(
                  villainAnimation: VillainAnimation.fromBottom(
                    relativeOffset: 0.2,
                    from: Duration(milliseconds: 50),
                    to: Duration(milliseconds: 350),
                  ),
                  animateExit: false,
                  child: new SizedBox(
                    width: 300.0,
                    height: 200.0,
                    child: new ScalableImage(
                        imageProvider: new AssetImage('Map1.png'),
                        dragSpeed: 4.0,
                        maxScale: 6.0),
                  ),
                ),
                Villain(
                  villainAnimation: VillainAnimation.fromBottom(
                    relativeOffset: 0.2,
                    from: Duration(milliseconds: 350),
                    to: Duration(milliseconds: 650),
                  ),
                  animateExit: false,
                  secondaryVillainAnimation: VillainAnimation.fade(),
                  child: new SizedBox(
                    width: 300.0,
                    height: 200.0,
                    child: new ScalableImage(
                        imageProvider: new AssetImage('Map2.png'),
                        dragSpeed: 4.0,
                        maxScale: 6.0),
                  ),
                ),
                Villain(
                  villainAnimation: VillainAnimation.fromBottom(
                    relativeOffset: 0.2,
                    from: Duration(milliseconds: 350),
                    to: Duration(milliseconds: 650),
                  ),
                  animateExit: false,
                  secondaryVillainAnimation: VillainAnimation.fade(),
                  child: new SizedBox(
                    width: 300.0,
                    height: 200.0,
                    child: new ScalableImage(
                        imageProvider: new AssetImage('Map3.png'),
                        dragSpeed: 4.0,
                        maxScale: 6.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ));
}
