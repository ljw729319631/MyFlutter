import 'package:flutter/material.dart';

class FutureBuilderPage extends StatefulWidget {
  FutureBuilderPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _FutureBuilderPageState createState() => _FutureBuilderPageState();
}

class _FutureBuilderPageState extends State<FutureBuilderPage> {
  Future<String> mockNetworkData() async {
    return Future.delayed(Duration(seconds: 2), () => '我是数据哦数据哦数据哦');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: FutureBuilder<String>(
            future: mockNetworkData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Text('Contents : ${snapshot.data}');
                }
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
