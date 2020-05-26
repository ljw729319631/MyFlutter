import 'package:flutter/material.dart';

import 'dart:async';
import 'package:flutter/services.dart';

class BatteryPage extends StatefulWidget {
  BatteryPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _BatteryPageState createState() => _BatteryPageState();
}

class _BatteryPageState extends State<BatteryPage> {
  static const platform = const MethodChannel('samples.flutter.io/battery');

  String _batteryLevel = 'Unknown battery level.';

  _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Faild to get battery level : '${e.message}' .";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new RaisedButton(
                  child: Text('Get Battery Level'), 
                  onPressed: _getBatteryLevel),
              new Text('电量是： $_batteryLevel %')
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
