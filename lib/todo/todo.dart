import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => new _TodoState();
}

enum _Actions { deleteAll }
enum _ItemActions { delete, edit }

class _TodoState extends State<Todo> {
  final _storage = new FlutterSecureStorage();

  String Item;
  List<_SecItem> _items = [];

  @override
  void initState() {
    super.initState();

    _readAll();
  }

  Future<Null> _readAll() async {
    final all = await _storage.readAll();
    setState(() {
      return _items = all.keys
          .map((key) => new _SecItem(key, all[key]))
          .toList(growable: false);
    });
  }

  void _onChanged(String val) {
    setState(() {
      Item = val;
    });
  }

  void _openAddTaskDialog() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new AddTaskDialog();
        },
        fullscreenDialog: true));
  }
  
  _addNewItem() async {
    final String key = _randomValue();
    final String value = Item;

    await _storage.write(key: key, value: value);
    _readAll();
  }

  @override
  Widget build(BuildContext context) => new Scaffold(
        appBar: new AppBar(
          title: new Text('Tasks'),
          actions: <Widget>[
            new IconButton(
                onPressed: _openAddTaskDialog, icon: new Icon(Icons.add)),
          ],
        ),
        body: new ListView.builder(
          itemCount: _items.length,
          itemBuilder: (BuildContext context, int index) => new Card(
                elevation: 2.0,
                child: new ListTile(
                  trailing: new PopupMenuButton(
                      onSelected: (_ItemActions action) =>
                          _performAction(action, _items[index]),
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<_ItemActions>>[
                            new PopupMenuItem(
                              value: _ItemActions.delete,
                              child: new Text('Done'),
                            ),
                            new PopupMenuItem(
                              value: _ItemActions.edit,
                              child: new Text('Edit'),
                            ),
                          ]),
                  title: new Text(_items[index].value),
                ),
              ),
        ),
      );

  Future<Null> _performAction(_ItemActions action, _SecItem item) async {
    switch (action) {
      case _ItemActions.delete:
        await _storage.delete(key: item.key);
        _readAll();

        break;
      case _ItemActions.edit:
        final result = await showDialog<String>(
            context: context,
            builder: (context) => new _EditItemWidget(item.value));
        if (result != null) {
          _storage.write(key: item.key, value: result);
          _readAll();
          Navigator.of(context).pop();
        }
        break;
    }
  }

  String _randomValue() {
    final rand = new Random();
    final codeUnits = new List.generate(20, (index) {
      return rand.nextInt(26) + 65;
    });

    return new String.fromCharCodes(codeUnits);
  }
}

class _EditItemWidget extends StatelessWidget {
  final TextEditingController _controller;

  _EditItemWidget(String text)
      : _controller = new TextEditingController(text: text);

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: new Text('Edit item'),
      content: new TextField(
        controller: _controller,
        autofocus: true,
      ),
      actions: <Widget>[
        new FlatButton(
            onPressed: () => Navigator.of(context).pop(),
            child: new Text('Cancel')),
        new FlatButton(
            onPressed: () => Navigator.of(context).pop(_controller.text),
            child: new Text('Save')),
      ],
    );
  }
}

class _SecItem {
  final String key;
  final String value;

  _SecItem(this.key, this.value);
}

class AddTaskDialog extends StatefulWidget {
  @override
  AddTaskDialogState createState() => new AddTaskDialogState();
}

class AddTaskDialogState extends State<AddTaskDialog> {
  final _storage = new FlutterSecureStorage();

  String Item;
  List<_SecItem> _items = [];

  @override
  void initState() {
    super.initState();

    _readAll();
  }

  Future<Null> _performAction(_ItemActions action, _SecItem item) async {
    switch (action) {
      case _ItemActions.delete:
        await _storage.delete(key: item.key);
        _readAll();

        break;
      case _ItemActions.edit:
        final result = await showDialog<String>(
            context: context,
            builder: (context) => new _EditItemWidget(item.value));
        if (result != null) {
          _storage.write(key: item.key, value: result);
          _readAll();
          Navigator.of(context).pop();
        }
        break;
    }
  }

  Future<Null> _readAll() async {
    final all = await _storage.readAll();
    setState(() {
      return _items = all.keys
          .map((key) => new _SecItem(key, all[key]))
          .toList(growable: false);
    });
  }

  void saveTask() async {
    final String key = _randomValue();

    _storage.write(key: key, value: Item);
    _readAll();
  }

  void _onChanged(String val) {
    setState(() {
      Item = val;
    });
  }

  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('New task'),
        actions: [
          new FlatButton(
              onPressed: () {
                saveTask();
                Navigator.of(context).pop();
              },
              child: new Text('SAVE',
                  style: Theme.of(context)
                      .textTheme
                      .subhead
                      .copyWith(color: Colors.white))),
        ],
      ),
      body: new PageView(
        children: <Widget>[
          new ListTile(
            title: new TextField(
              decoration: new InputDecoration(
                hintText: "Task..",
              ),
              controller: _controller,
              autofocus: true,
              onChanged: _onChanged,
            ),
          )
        ],
      ),
    );
  }

  String _randomValue() {
    final rand = new Random();
    final codeUnits = new List.generate(20, (index) {
      return rand.nextInt(26) + 65;
    });

    return new String.fromCharCodes(codeUnits);
  }
}