import 'package:flutter/material.dart';

class GridPage extends StatefulWidget {
  GridPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GridPageState createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}