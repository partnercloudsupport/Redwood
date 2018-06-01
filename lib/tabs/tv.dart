import 'package:flutter/material.dart';

class Tv extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Container(
    child: new ListView(
      children: <Widget>[
        new Card(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: const Icon(Icons.tv),
                title: const Text('Redwood TV - Season 7 - Episode 25'),
                subtitle: const Text('Published on May 21, 2018'),
              ),
              new Image.network(
                'https://img.youtube.com/vi/u-x4LtVkTyQ/maxresdefault.jpg',
              ),
              new ButtonTheme.bar( // make buttons use the appropriate styles for cards
                child: new ButtonBar(
                  children: <Widget>[
                    new FlatButton(
                      child: const Text('Watch Now'),
                      onPressed: () { /* ... */ },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        new Card(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: const Icon(Icons.tv),
                title: const Text('Redwood TV - Season 7 - Episode 24'),
                subtitle: const Text('Published on May 12, 2018'),
              ),
              new Image.network(
                'https://img.youtube.com/vi/gZOGIHmLFlQ/hqdefault.jpg',
              ),
              new ButtonTheme.bar( // make buttons use the appropriate styles for cards
                child: new ButtonBar(
                  children: <Widget>[
                    new FlatButton(
                      child: const Text('Watch Now'),
                      onPressed: () { /* ... */ },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        new Card(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: const Icon(Icons.tv),
                title: const Text('Redwood TV - Season 7 - Episode 23'),
                subtitle: const Text('Published on May 2, 2018'),
              ),
              new Image.network(
                'https://img.youtube.com/vi/4G84dpt4xKE/maxresdefault.jpg',
              ),
              new ButtonTheme.bar( // make buttons use the appropriate styles for cards
                child: new ButtonBar(
                  children: <Widget>[
                    new FlatButton(
                      child: const Text('Watch Now'),
                      onPressed: () { /* ... */ },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    )

  );
}