import 'package:flutter/material.dart';
import 'package:flutter_my_app/common/UserModel.dart';
import 'package:provider/provider.dart';

import 'gmAvatar.dart';

class MyDrawer extends StatelessWidget{
  const MyDrawer({Key key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildHeader(), //菜单头部
              Expanded(child: _buildMenus()),//构建功能菜单
            ],
          )),
    );
  }

  Widget _buildHeader() {
    return Consumer<UserModel>(
      builder: (context,value,child){
        return GestureDetector(
          child: Container(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.only(top: 40,bottom: 20),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ClipOval(
                    child: value.isLogin ?
                    gmAvatar(value.user.avatar_url,width: 80):
                        Image.asset(
                          'images/lake.jpg',
                          width: 80,
                        ),
                  ),
                ),
                Text(
                  value.isLogin ? value.user.login : 'login',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
              ],
            ),
          ),
          onTap: (){
            if(!value.isLogin) Navigator.of(context).pushNamed("login");
          },
        );
      }
    );
  }

  Widget _buildMenus() {
    return Consumer<UserModel>(
      builder: (context,value,child){
        return ListView(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.color_lens),
              title: Text('换肤'),
              onTap: ()=> Navigator.of(context).pushNamed("themes"),
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: Text('语言'),
              onTap: ()=> Navigator.of(context).pushNamed("language"),
            ),
            if(value.isLogin)
              ListTile(
                leading: const Icon(Icons.power_settings_new),
                title: Text('注销'),
                onTap: (){
                  showDialog(
                    context:context,
                    builder:(ctx){
                      return AlertDialog(
                        content:  Text('是否确认'),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('取消'),
                            onPressed: ()=> Navigator.pop(context),
                          ),
                          FlatButton(
                            child: Text('确定'),
                            onPressed: (){
                              value.user = null;
                              Navigator.pop(context);
                            },
                          )
                        ]
                      );
                    }
                  );
                },
              ),
          ],
        );
      }
    );
  }
}