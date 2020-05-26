import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_app/common/Git.dart';
import 'package:flutter_my_app/common/RepoItem.dart';
import 'package:flutter_my_app/common/UserModel.dart';
import 'package:flutter_my_app/models/repo.dart';
import 'package:flutter_my_app/widgets/MyDrawer.dart';
import 'package:flutter_my_app/widgets/show.dart';
import 'package:provider/provider.dart';

class HomeRoute extends StatefulWidget {
  HomeRoute({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: _buildBody(),
        drawer: MyDrawer(),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildBody(){
    UserModel userModel = Provider.of<UserModel>(context);
    if(!userModel.isLogin){
      return Center(
        child: RaisedButton(
          child: Text('login'),
          onPressed: ()=> Navigator.of(context).pushNamed("login"),
        ),
      );
    }else{
      return InfiniteListView<Repo>(
        onRetrieveData: (int page, List<Repo> items, bool refresh) async{
          try{
            var data = await Git(context).getRepos(
                refresh: refresh,
                queryParameters: {
                  'page':page,
                  'page_size':20,
                }
            );
            //把请求到的新数据添加到items中
            items.addAll(data);
            //如果接口返回的数量等于‘page_size’,则认为还有数据，反之则认为最后一页
            return data.length == 20;
          }catch(e){
            if(e.response?.status == 401){
              showToast('登录失败');
            }else{
              showToast(e.toString());
            }
          }

          return false;
        },
        itemBuilder: (List list, int index, BuildContext context){
          //项目信息列表项
          return RepoItem(list[index]);
        },
      );


    }
  }

}
