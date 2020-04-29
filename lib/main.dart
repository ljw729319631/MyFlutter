import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_my_app/HomePage.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'My APP',
      theme: new ThemeData(
        primarySwatch: Colors.blue

      ),
      home: new HomePagePage(),
    );
  }
}

class MyPavlova extends StatelessWidget{
  Widget iconBuild(IconData icon, String text, String number){
    return new Container(
      child: new Column(
        children: <Widget>[
          new Icon(icon),
          new Text(text,style: new TextStyle(color: Colors.black),),
          new Text(number,style: new TextStyle(color: Colors.blue[200]))
        ],
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    var textStyle = new TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18.0,
      height: 2.0
    );
    var titleSection = new Text(
      'Strawberry Pavlova',
      style: textStyle,
    );
    var descSection = new Container(
      margin: EdgeInsets.only(top: 10),
      child: new Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, ',
        style: textStyle,
      ),
    );
    var icons = new Icon(
      Icons.star,
      color: Colors.black,
    );
    var secondBox = new Container(
      padding: EdgeInsets.all(20.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              icons,
              icons,
              icons,
              icons,
              icons,
            ],
          ),
          new Container(
            margin: EdgeInsets.only(bottom: 10.0),
            child: new Text(
              '170 Reviews',
              style: textStyle,
            ),
          )
        ],
      ),
    );
    var threeBox = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          iconBuild(Icons.share,"haha","123"),
          iconBuild(Icons.search,"xixi","456"),
          iconBuild(Icons.map,"haha","789"),
        ],
      ),
    );
    var box = new Container(
      margin: EdgeInsets.all(10),
      child: new Column(
        children: <Widget>[
          titleSection,
          descSection,
          secondBox,
          threeBox,
        ],
      ),
    );
    return box;
  }

}
class MyAppSection extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Oeschinen Lake Campground',
                    style: new TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  'Kandersteg, Switzerland',
                  textDirection: TextDirection.ltr,
                  style: new TextStyle(
                    fontSize: 12,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          new Icon(
            Icons.star,
            color: Colors.red[400],
            size: 20,
          ),
          new Text(
            '41',
            style: new TextStyle(
              fontSize: 10,
              color: Colors.black,
            ),
            textDirection: TextDirection.ltr,
          )
        ],
      ),
    );
    Column buildButtonColumn(IconData icon, String label){
      Color color = Theme.of(context).primaryColor;

      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment:MainAxisAlignment.center,
        children: <Widget>[
          new Icon(icon,color: color),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          )
        ],
      );
    }
    Widget buttonSetion = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );
    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        '''Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.''',
        softWrap: true,
      ),
    );
    Widget imgSection = new Container(
      child: new Image.asset(
        'images/lake.jpg',
        fit: BoxFit.cover,
        height: 240.0,
        width: 600.0,
      ),
    );
    return new ListView(
      children: <Widget>[
        imgSection,
        titleSection,
        buttonSetion,
        textSection
      ],
    );
  }
}
//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  MyApp({this.title});
//  final Widget title;
//
//  @override
//  Widget build(BuildContext context) {
////    return MaterialApp(
////      title: 'My App',
////      theme: new ThemeData(
////        primaryColor: Colors.black
////      ),
////      home: new RandomWords(),
////    );
//    return new Container(
//      height: 60,
//      padding: const EdgeInsets.symmetric(horizontal: 8.0),
//      decoration: new BoxDecoration(color: Colors.red[500]),
//      child: new Row(
//        children: <Widget>[
//          new IconButton(
//              icon: new Icon(Icons.menu),
//              tooltip: 'Navigation menu',
//              onPressed: null),
//          new Expanded(child: title),
//          new IconButton(
//              icon: new Icon(Icons.search), tooltip: 'Search', onPressed: null)
//        ],
//      ),
//    );
//  }
//}
//
//class Product{
//  const Product({this.name});
//  final String name;
//}
//
//typedef void CartChangedCallback(Product product, bool inCart);
//
//class ShoppingListItem extends StatelessWidget{
//  ShoppingListItem({Product product,this.inCart,this.onCartChanged})
//      : product = product,
//      super(key: new ObjectKey(product));
//  final Product product;
//  final bool inCart;
//  final CartChangedCallback onCartChanged;
//
//  Color _getColor(BuildContext context){
//    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
//  }
//
//  TextStyle _getTextStyle(BuildContext context){
//    if(!inCart) return null;
//    return new TextStyle(
//      color: Colors.black54,
//      decoration: TextDecoration.lineThrough,
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new ListTile(
//      onTap: (){
//        onCartChanged(product,inCart);
//      },
//      leading: new CircleAvatar(
//        backgroundColor: _getColor(context),
//        child: new Text(product.name[0]),
//      ),
//      title: new Text(product.name,style: _getTextStyle(context),),
//    );
//  }
//
//}
//
//class ShoppingList extends StatefulWidget{
//  ShoppingList({Key key,this.products}) : super(key : key);
//  final List<Product> products;
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return new _ShoppingListState();
//  }
//}
//
//class _ShoppingListState extends State<ShoppingList>{
//  Set<Product> _shoppoingCart = new Set<Product>();
//
//  void _handleCartChanged(Product product,bool inCart){
//    setState(() {
//      if(inCart){
//        _shoppoingCart.add(product);
//      }else{
//        _shoppoingCart.remove(product);
//      }
//    });
//  }
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('Shopping List'),
//      ),
//      body: new ListView(
//        padding: new EdgeInsets.symmetric(vertical: 8.0),
//        children: widget.products.map((Product product){
//          return new ShoppingListItem(
//            product: product,
//            inCart: _shoppoingCart.contains(product),
//            onCartChanged: _handleCartChanged,
//          );
//        }).toList(),
//      ),
//    );
//  }
//
//}
//
//class MyButton extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new GestureDetector(
//      onLongPress: (){
//        print('long touch');
//      },
//      onTap: (){
//        print('MyButton was tapped!');
//      },
//      child: new Container(
//        height: 36.0,
//        padding: const EdgeInsets.all(8.0),
//        margin: const EdgeInsets.symmetric(horizontal: 8.0),
//        decoration: new BoxDecoration(
//          borderRadius: new BorderRadius.circular(5.0),
//          color: Colors.lightGreen[500]
//        ),
//        child: new Center(
//          child: new Text('Engage'),
//        ),
//      ),
//    );
//  }
//}
//
//class Counter extends StatefulWidget{
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return new _CounterState();
//  }
//}
//
//class _CounterState extends State{
//  int _counter = 0;
//
//  void _increment(){
//    setState(() {
//      ++_counter;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new Column(
//      children: <Widget>[
//        new Expanded(child: new Text('111')),
//        new CounterIncrementor(onPressed: _increment,),
//        new CounterDisplay(count: _counter,),
//      ],
//    );
//  }
//}
//
//class CounterDisplay extends StatelessWidget{
//  CounterDisplay({this.count});
//  final int count;
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new Container(
//      height: 580,
//      decoration: new BoxDecoration(color:Colors.lightGreen[200]),
//      child: new Center(
//          child: new Text('count: $count')
//      ),
//    );
//  }
//}
//
//class CounterIncrementor extends StatelessWidget{
//  CounterIncrementor({this.onPressed});
//  final VoidCallback onPressed;
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new RaisedButton(
//      onPressed: onPressed,
//      child: new Text('Increment'),);
//  }
//
//}
//
//class TutorialHome extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new Scaffold(
//      appBar: new AppBar(
//        leading: new IconButton(
//            icon: new Icon(Icons.menu),
//            tooltip: 'navigation menu',
//            onPressed: null),
//        title: new Text('example title'),
//        actions: <Widget>[
//          new IconButton(
//              icon: new Icon(Icons.search),
//              tooltip: 'Search',
//              onPressed: null),
//          new IconButton(
//              icon: new Icon(Icons.map),
//              tooltip: 'Search',
//              onPressed: null)
//        ],
//      ),
//      body: new Center(
//        child: new Text('HI LJW ,Hello World'),
//      ),
//      floatingActionButton: new FloatingActionButton(
//          tooltip: 'Add',
//        child: new Icon(Icons.add),
//        onPressed: null,
//      ),
//    );
//  }
//
//}
//
//class MyScaffold extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new Material(
//      child: new Column(
//        children: <Widget>[
//          new Container(
//            height: 90,
//            decoration: new BoxDecoration(color:Colors.green[200]),
//            child: new Column(
//              children: <Widget>[
//                new Expanded(
//                    child: new Center(
//                      child: new Text('111')
//                    ))
//              ],
//            ) ,
//          ),
//          new MyApp(
//            title: new Text(
//              'Example Title',
//              style: Theme.of(context).primaryTextTheme.title,
//            ),
//          ),
//          new Expanded(
//              child: new Center(
//            child: new Text('Hello World'),
//          ))
//        ],
//      ),
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  // This widget is the home page of your application. It is stateful, meaning
//  // that it has a State object (defined below) that contains fields that affect
//  // how it looks.
//
//  // This class is the configuration for the state. It holds the values (in this
//  // case the title) provided by the parent (in this case the App widget) and
//  // used by the build method of the State. Fields in a Widget subclass are
//  // always marked "final".
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;
//
//  void _incrementCounter() {
//    setState(() {
//      // This call to setState tells the Flutter framework that something has
//      // changed in this State, which causes it to rerun the build method below
//      // so that the display can reflect the updated values. If we changed
//      // _counter without calling setState(), then the build method would not be
//      // called again, and so nothing would appear to happen.
//      _counter++;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // This method is rerun every time setState is called, for instance as done
//    // by the _incrementCounter method above.
//    //
//    // The Flutter framework has been optimized to make rerunning build methods
//    // fast, so that you can just rebuild anything that needs updating rather
//    // than having to individually change instances of widgets.
//    return Scaffold(
//      appBar: AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: Text(widget.title),
//      ),
//      body: Center(
//        // Center is a layout widget. It takes a single child and positions it
//        // in the middle of the parent.
//        child: Column(
//          // Column is also layout widget. It takes a list of children and
//          // arranges them vertically. By default, it sizes itself to fit its
//          // children horizontally, and tries to be as tall as its parent.
//          //
//          // Invoke "debug painting" (press "p" in the console, choose the
//          // "Toggle Debug Paint" action from the Flutter Inspector in Android
//          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//          // to see the wireframe for each widget.
//          //
//          // Column has various properties to control how it sizes itself and
//          // how it positions its children. Here we use mainAxisAlignment to
//          // center the children vertically; the main axis here is the vertical
//          // axis because Columns are vertical (the cross axis would be
//          // horizontal).
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(
//              'You have pushed the button this many times:',
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.display1,
//            ),
//          ],
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
//    );
//  }
//}
//
//class RandomWords extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return new RandomWordsState();
//  }
//}
//
//class RandomWordsState extends State<RandomWords> {
//  final _saved = new Set<WordPair>();
//  final _suggestions = <WordPair>[];
//  final _biggerFont = const TextStyle(fontSize: 18.0);
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('Startup Name Generator'),
//        actions: <Widget>[
//          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
//        ],
//      ),
//      body: _buildSuggestions(),
//    );
//  }
//
//  void _pushSaved() {
//    Navigator.of(context).push(
//      new MaterialPageRoute(
//        builder: (context) {
//          final tiles = _saved.map(
//            (pair) {
//              return new ListTile(
//                title: new Text(
//                  pair.asPascalCase,
//                  style: _biggerFont,
//                ),
//              );
//            },
//          );
//          final divided = ListTile.divideTiles(
//            context: context,
//            tiles: tiles,
//          ).toList();
//          return new Scaffold(
//            appBar: new AppBar(
//              title: new Text('Saved Suggedtions'),
//            ),
//            body: new ListView(
//              children: divided,
//            ),
//          );
//        },
//      ),
//    );
//  }
//
//  Widget _buildSuggestions() {
//    return ListView.builder(
//        padding: const EdgeInsets.all(10.0),
//        itemBuilder: (context, i) {
//          if (i.isOdd) return new Divider();
//          final index = i ~/ 2;
//          if (index >= _suggestions.length) {
//            _suggestions.addAll(generateWordPairs().take(10));
//          }
//          return _buildRow(_suggestions[index]);
//        });
//  }
//
//  Widget _buildRow(WordPair pair) {
//    final alreadySaved = _saved.contains(pair);
//    return new ListTile(
//        title: new Text(
//          pair.asPascalCase,
//          style: _biggerFont,
//        ),
//        trailing: new Icon(
//          alreadySaved ? Icons.favorite : Icons.favorite_border,
//          color: alreadySaved ? Colors.red : null,
//        ),
//        onTap: () {
//          setState(() {
//            if (alreadySaved) {
//              _saved.remove(pair);
//            } else {
//              _saved.add(pair);
//            }
//          });
//        });
//  }
//}
