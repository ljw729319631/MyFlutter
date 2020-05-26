import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DioPage extends StatefulWidget {
  DioPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DioPageState createState() => _DioPageState();
}

class _DioPageState extends State<DioPage> {
  Dio _dio = new Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          alignment: Alignment.center,
          child: FutureBuilder(
              future:
                  _dio.get('https://api.github.com/orgs/flutterchina/repos'),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  Response response = snapshot.data;
                  //发生错误
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  //请求成功
                  return ListView(
                    children: response.data
                        .map<Widget>(
                            (e) => ListTile(title: Text(e["full_name"])))
                        .toList(),
                  );
                }
                return CircularProgressIndicator();
              }),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
