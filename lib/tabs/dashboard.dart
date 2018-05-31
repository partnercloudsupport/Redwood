import 'package:flutter/material.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Container(
    child:new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Icon(
            Icons.menu,
            size: 150.0,
            color: Colors.black12
        ),
        new Text('Feed Coming Soon!')
      ],
    )
  );
}