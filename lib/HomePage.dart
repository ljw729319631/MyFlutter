import 'package:flutter/material.dart';

class HomePagePage extends StatefulWidget {
  HomePagePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePagePageState createState() => _HomePagePageState();
}

class _HomePagePageState extends State<HomePagePage>
    with SingleTickerProviderStateMixin {
  int _selectIndex = 0;
  int _bottomSelectIndex = 0;
  List<Widget> _viewList; //创建视图数组
  TabController _tabController;
  List tabs = ['haha', 'xixi', 'hehe'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _viewList = new List();
    _viewList.add(new Container(child: new Center(child: Text('111'),),));
    _viewList.add(new Container(child: new Center(child: Text('222'),),));
  }

  Widget myBottomAppBar = BottomAppBar(
    color: Colors.white,
    shape: CircularNotchedRectangle(),
    child: Row(
      children: <Widget>[
        IconButton(icon: Icon(Icons.home),onPressed:(){

        }),
        SizedBox(),
        IconButton(icon: Icon(Icons.home),onPressed: (){

        },),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    ),
//        currentIndex: _selectIndex,
//        fixedColor: Colors.red,
//        onTap:
//            _onItemTapped, //点击tab时的回调  然后通过这个方法把index传给selectIndex 然后调用setState刷新数据UI
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('App Name'),
        bottom: new TabBar(
          controller: _tabController,
          tabs: tabs
              .map((e) => new Tab(
                    text: e,
                  ))
              .toList(),
        ),
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(
              Icons.dashboard,
              color: Colors.white,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        actions: <Widget>[
          IconButton(
              icon: new Icon(
                Icons.share,
                color: Colors.white,
              ),
              onPressed: null),
        ],
      ),
      drawer: new Drawer(),
//      floatingActionButton: FloatingActionButton(onPressed: null,child: new Icon(Icons.add),),
//      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:
      BottomNavigationBar(
        currentIndex: _selectIndex,
        onTap: _onItemTapped,
        fixedColor: Colors.blue,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text('Business')),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), title: Text('School'))
        ],
      ),
      body: new TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(
              e,
              textScaleFactor: 5,
            ),
          );
        }).toList(),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  void _onMyAppBarItem(int index){
    setState(() {
      _bottomSelectIndex = index;
    });
  }
}
