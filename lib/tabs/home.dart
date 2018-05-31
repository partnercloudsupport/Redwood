import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Container(
      child: new ListView.builder(
        itemBuilder: (BuildContext context, int index) => new EntryItem(data[index]),
        itemCount: data.length,)
  );
}


// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);
  final String title;
  final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  new Entry('Monday (All Periods)',
    <Entry>[
      new Entry('0 Period 7:05-7:55'
          '\n\n1st Period 8:00-8:45'
          '\n\n2nd Period 8:50-9:35'
          '\n\nBreak 9:35-9:45'
          '\n\n3rd Period 9:50-10:35'
          '\n\nAdvisory 10:40-11:20'
          '\n\n4th Period 11:25-12:10'
          '\n\nLunch 12:10-12:45'
          '\n\n5th Period 12:50-1:35'
          '\n\n6th Period 1:40-2:25'
          '\n\n7th Period 2:30-3:15\n'),
    ],
  ),
  new Entry('Tuesday & Friday (All Periods)',
    <Entry>[
      new Entry('0 Period 7:05-7:55'
          '\n\n1st Period 8:00-8:50'
          '\n\n2nd Period 8:55-9:45'
          '\n\nBreak 9:45-9:55'
          '\n\n3rd Period 10:00-10:50'
          '\n\n4th Period 10:55-11:45'
          '\n\nLunch 11:45-12:25'
          '\n\n5th Period 12:30-1:20'
          '\n\n6th Period 1:25-2:15'
          '\n\n7th Period 2:20-3:10\n'),
    ],
  ),
  new Entry('Wednesday (Block Schedule)',
    <Entry>[
      new Entry('0 Period 7:05-7:55'
          '\n\n4th Period 8:00-9:30'
          '\n\nBreak 9:30-9:40'
          '\n\n5th Period 9:45-11:15'
          '\n\nLunch 11:15-11:50'
          '\n\n6th Period 11:55-1:25'
          '\n\nBreak 1:25-1:35'
          '\n\n7th Period 1:40-3:10\n'),
    ],
  ),
  new Entry('Thursday (Block Schedule)',
    <Entry>[
      new Entry('0 Period 7:05-7:55'
          '\n\n1st Period 8:00-9:30'
          '\n\nSMART Period 9:35-10:20'
          '\n\nBreak 10:20-10:30'
          '\n\n2nd Period 10:35-12:05'
          '\n\nLunch 12:05-12:50'
          '\n\n3rd Period 12:55-2:25'
          '\n\nFaculty Meeting 2:35-3:30\n'),
    ],
  ),
  new Entry('Rally Thursday',
    <Entry>[
      new Entry('0 Period 7:05-7:55'
          '\n\n1st Period 8:00-9:30'
          '\n\nBreak 9:30-9:40'
          '\n\n2nd Period 9:45-11:15'
          '\n\nRally 11:20-12:05'
          '\n\nLunch 12:05-12:50'
          '\n\n3rd Period 12:55-2:25\n'),
    ],
  ),
  new Entry('Assembly Thursday',
    <Entry>[
      new Entry('0 Period 7:05-7:55'
          '\n\n1st Period 8:00-9:30'
          '\n\nBreak 9:30-9:40'
          '\n\n2nd Period 9:45-11:15'
          '\n\nAssembly 11:20-12:20'
          '\n\nLunch 12:20-12:55'
          '\n\n3rd Period 1:00-2:30\n'),
    ],
  ),
  new Entry('Minimum Day Friday',
    <Entry>[
      new Entry('0 Period 7:05-7:55'
          '\n\n1st Period 8:00-8:35'
          '\n\n2nd Period 8:40-9:15'
          '\n\n3rd Period 9:20-9:55'
          '\n\nBreak 9:55-10:05'
          '\n\n4th Period 10:10-10:45'
          '\n\n5th Period 10:50-11:25'
          '\n\n6th Period 11:30-12:05'
          '\n\n7th Period 12:10-12:45\n'),
    ],
  ),

];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty)
      return new ListTile(title: new Text(root.title));
    return new ExpansionTile(
      key: new PageStorageKey<Entry>(root),
      title: new Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}