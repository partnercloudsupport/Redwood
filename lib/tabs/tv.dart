import 'package:flutter/material.dart';

class Tv extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Container(
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Card(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: const Icon(Icons.tv),
                title: const Text('Redwood TV'),
                subtitle: const Text('Season 7 Episode 25'),
              ),
              new Image.network(
                'https://img.youtube.com/vi/u-x4LtVkTyQ/maxresdefault.jpg',
              ),
              new Text('\n*This is currently not working*\n')
            ],
          ),

        )

      ],

    ),

  );
}