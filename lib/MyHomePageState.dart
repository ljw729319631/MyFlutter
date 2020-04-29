import 'package:flutter/material.dart';

class MyHomePageStatePage extends StatefulWidget {
  MyHomePageStatePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageStatePageState createState() => _MyHomePageStatePageState();
}

class _MyHomePageStatePageState extends State<MyHomePageStatePage> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  bool _active = false;

  void _handleTapboxChanged(bool newValue){
    setState(() {
      _active = newValue;
    });
  }

  void _handleTap(){
    setState(() {
      _active = !_active;
    });
  }
  
  void _toggleFavorite(){
    setState(() {
      if(_isFavorited){
        _favoriteCount -= 1;
        _isFavorited = false;
      }else{
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  Widget getGestureDetector(){
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0,color: _active ? Colors.white : Colors.red),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600]
        ),
      ),
    );
  }
  
  Widget getStar(){
    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.all(0.0),
          child: new IconButton(
              icon: (_isFavorited ? new Icon(Icons.star) : new Icon(Icons.star_border)),
              color: Colors.red[500],
              onPressed: _toggleFavorite),
        ),
        new SizedBox(
          width: 18.0,
          child: new Container(
            child: new Text('$_favoriteCount'),
          ),
        )
      ],
      
    );
  }

  Widget BuildCard(){
    return new SizedBox(
      height: 210.0,
      child: new Card(
        child: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Text(
                  '收藏数量：',
                  textDirection: TextDirection.ltr,
                  style: new TextStyle(fontSize: 15, color: Colors.blue
                  ),
                ),
                new Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.red,
                )
              ],
            ),
            new Divider(),
            new ListTile(
              title: new Text('1625 Main Street',
                style: new TextStyle(fontWeight: FontWeight.w500),),
              leading: new Icon(
                Icons.restaurant_menu,
                color: Colors.blue[500],
              ),
            ),
            new ListTile(
              title: new Text('costa@example.com'),
              leading: new Icon(
                Icons.contact_mail,
                color: Colors.blue[500],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget BuildStack(){
    return new Stack(
      alignment: const Alignment(0.6, 0.6),
      children: <Widget>[
        new CircleAvatar(
          backgroundImage: new AssetImage('images/lake.jpg'),
          radius: 100.0,
        ),
        new Container(
          decoration: new BoxDecoration(
              color: Colors.black45
          ),
          child: new Text(
            'mia A',
            style: new TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
            ),
          ),
        )
      ],
    );
  }

  List<Container> _buildListView2(int count){
    List<Container> string_data = new List();
    for (int i = 0; i < count; i++) {
      string_data.add(new Container(
        child: new Text('这是第$i个'),
      ));
    }
//    return new List<Container>.generate(count,
//        (int index) => new Container(
//          child: new Text('这是第$index个'),
//        ));
    return string_data;
  }

  List<Container> _buildGridTileList(int count){
    return new List<Container>.generate(
        count,
        (int index) => new Container(
            child: new Row(
                children: <Widget>[
                  new Text(index.toString(),
                      style: new TextStyle(color: Colors.black26),
                  ),

                ],

            )
        ),
    );
  }

  List<Container> _buildListView(int count){
    return new List<Container>.generate(
        count,
            (int index) => new Container(
              padding: EdgeInsets.all(5.0),
            child: new Row(
              children: <Widget>[
                new Image.network(
                    'https://cdn2.jianshu.io/assets/default_avatar/13-394c31a9cb492fcb39c27422ca7d2815.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240',
                  height: 50,
                  width: 50,
                ),
                new Text(
                  '$index',
                  style: new TextStyle(
                    color: Colors.black26,
                  ),
                ),
              ],
            )));
  }

  Widget BuildGrid(){
    return new GridView.extent(
      maxCrossAxisExtent: 150.0,
      padding: const EdgeInsets.all(4.0),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      children: _buildGridTileList(50),
    );
  }

  Widget BuildList(){
    return new ListView(
      children: _buildListView(90)
    );
  }

  Widget BuildList2(){
    return new ListView(
      children: _buildListView2(90)
    );
  }

  @override
  Widget build(BuildContext context) {
    var container = new Container(
      decoration: new BoxDecoration(
        color: Colors.black26,
      ),
      child: new Column(
        children: <Widget>[
          new Row(
             children: <Widget>[
               new Expanded(
                   child: new Container(
                     decoration: new BoxDecoration(
                       border: new Border.all(width: 10.0,color: Colors.black38),
                       borderRadius:
                         const BorderRadius.all(const Radius.circular(8.0)),
                     ),
                     margin: const EdgeInsets.all(4.0),
                     child: new Image.network('https://cdn2.jianshu.io/assets/default_avatar/13-394c31a9cb492fcb39c27422ca7d2815.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240'),
                   )
               ),
               new Expanded(
                   child: new Container(
                     decoration: new BoxDecoration(
                       border: new Border.all(width: 10.0,color: Colors.black38),
                       borderRadius:
                          const BorderRadius.all(const Radius.circular(8.0))
                     ),
                     margin: const EdgeInsets.all(4.0),
                     child: new Image.network('https://common.cnblogs.com/images/wechat.png'),
                   )
               ),
             ],
           ),
          new Row(
            children: <Widget>[
              new Expanded(
                  child: new Container(
                    decoration: new BoxDecoration(
                      border: new Border.all(width: 10.0,color: Colors.black38),
                      borderRadius:
                      const BorderRadius.all(const Radius.circular(8.0)),
                    ),
                    margin: const EdgeInsets.all(4.0),
                    child: new Image.network('https://cdn2.jianshu.io/assets/default_avatar/13-394c31a9cb492fcb39c27422ca7d2815.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240'),
                  )
              ),
              new Expanded(
                  child: new Container(
                    decoration: new BoxDecoration(
                        border: new Border.all(width: 10.0,color: Colors.black38),
                        borderRadius:
                        const BorderRadius.all(const Radius.circular(8.0))
                    ),
                    margin: const EdgeInsets.all(4.0),
                    child: new Image.network('https://common.cnblogs.com/images/wechat.png'),
                  )
              ),
            ],
          )
        ],
      ),
    );
    return Scaffold(
        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            new Container(
              child: new Checkbox(value: _active, onChanged: _handleTapboxChanged),
            ),
            new Container(
              child: new TapboxB(
                  active: _active,
                  onChanged: _handleTapboxChanged
              ),
            ),
            new Column(
              children: <Widget>[
                new RaisedButton.icon(onPressed: _handleTap, icon: Icon(Icons.info), label: Text('哈哈')),
                new Image(
                  image: AssetImage('images/lake.jpg'),
                  width: 400.0,
                )
              ],
            )
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class TapboxB extends StatelessWidget{
  TapboxB({Key key,this.active:false, @required this.onChanged}) : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap(){
    onChanged(!active);  //点击调用这个方法 这里的onChanged方法就等于调用了_handleTapboxChanged 把这个值传回给上面
                        //上面拿到active后调用setState方法重新把_active传给下面 下面的看到值变了  界面相应的变掉
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child:  new Text(
            active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        height: 200.0,
        width: 200.0,
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600]
        ),
      ),
    );
  }

}

class TapboxC extends StatefulWidget {
  TapboxC({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  _TapboxCState createState() => new _TapboxCState();
}

class _TapboxCState extends State<TapboxC>{
  @override
  Widget build(BuildContext context) {
    bool _highlight = false;

    void _handleTapDown(TapDownDetails details){
      setState(() {
        _highlight = false;
      });
    }

    void _handleTapUp(TapUpDetails details){
      setState(() {
        _highlight = true;
      });
    }

    void handleTapCancel(){
      setState(() {
        _highlight = false;
      });
    }

    void _handleTap(){
      widget.onChanged(!widget.active);
    }

    return null;
  }

}
