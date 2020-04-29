import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_app/test_bean_entity.dart';
import 'package:flutter_test/flutter_test.dart';


void main(){
  test('my first unit test', () {
    var answer = 42;
    expect(answer,42);
    print(answer);
//    Future<String> loadString = DefaultAssetBundle.of(new BuildContext()).loadString("data/currency.json");
//    loadString.then((String value){
//      Map map = json.decode(value);
//      var testJson = new TestBeanEntity().fromJson(map);
//      print(testJson.data.content[0].id);
//    });
  });
  testWidgets('Widget Test', (WidgetTester tester) async{
    await tester.pumpWidget(
      StatefulBuilder(builder: (BuildContext context,StateSetter setState){
        Future<String> loadString = DefaultAssetBundle.of(context).loadString("data/currency.json");
        loadString.then((String value){
          Map map = json.decode(value);
          var testJson = new TestBeanEntity().fromJson(map);
          print(testJson.data.content[0].id);
        });
        return MaterialApp(
          theme: new ThemeData(
              primarySwatch: Colors.blue
          ),
        );
      })
    );
  });
}