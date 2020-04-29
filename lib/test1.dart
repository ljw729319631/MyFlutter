import 'package:flutter/material.dart';

class test1Page extends StatefulWidget {
  test1Page({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _test1PageState createState() => _test1PageState();
}

class _test1PageState extends State<test1Page> {

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