import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Container(
          child: new ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            new EntryItem(data[index]),
        itemCount: data.length,
      ));
}

// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  new Entry(
    'Monday (All Periods)',
    <Entry>[
      new Entry('0 Period 7:05-7:55'
          '\n\n1st Period 8:00-8:48'
          '\n\n2nd Period 8:55-9:43'
          '\n\nBreak 9:43-9:53'
          '\n\n3rd Period 10:00-10:48'
          '\n\n4th Period 10:55-11:43'
          '\n\nLunch 11:43-12:18'
          '\n\n5th Period 12:25-1:13'
          '\n\n6th Period 1:20-2:08'
          '\n\n7th Period 2:15-3:03\n'),
    ],
  ),
  new Entry(
    'Tuesday & Friday (All Periods)',
    <Entry>[
      new Entry('0 Period 7:05-7:55'
          '\n\n1st Period 8:55-9:43 '
          '\n\n2nd Period 8:55-9:43'
          '\n\nBreak 9:43-9:53'
          '\n\n3rd Period 10:00-10:48'
          '\n\n4th Period 10:55-11:43'
          '\n\nLunch 11:43-12:18'
          '\n\n5th Period 12:25-1:13'
          '\n\n6th Period 1:20-2:08'
          '\n\n7th Period 2:15-3:03\n'),
    ],
  ),
  new Entry(
    'Wednesday (Block Schedule)',
    <Entry>[
      new Entry('0 Period 7:05-7:55'
          '\n\n4th Period 8:00-9:30'
          '\n\nBreak 9:30-9:40'
          '\n\n5th Period 9:47-11:17'
          '\n\nLunch 11:17-11:53'
          '\n\n6th Period 12:00-1:30'
          '\n\n7th Period 1:37-3:07\n'),
    ],
  ),
  new Entry(
    'Thursday (Block Schedule)',
    <Entry>[
      new Entry('0 Period 7:05-7:55'
          '\n\n1st Period 8:00-9:30'
          '\n\nHomeroom 9:37-9:47'
          '\n\nSmart 9:47-10:30'
          '\n\nBreak 10:30-10:40'
          '\n\n2nd Period 10:47-12:17'
          '\n\nLunch 12:17-12:55'
          '\n\n3rd Period 1:02-2:32'
          '\n\nStaff Meeting 2:42-3:37\n'),
    ],
  ),
  new Entry(
    'Rally Thursday',
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
  new Entry(
    'Assembly Thursday',
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
  new Entry(
    'Minimum Day Friday',
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
    if (root.children.isEmpty) return new ListTile(title: new Text(root.title));
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
