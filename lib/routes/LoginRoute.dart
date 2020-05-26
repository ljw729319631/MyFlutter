import 'package:flutter/material.dart';
import 'package:flutter_my_app/common/Git.dart';
import 'package:flutter_my_app/common/Global.dart';
import 'package:flutter_my_app/common/GmLocalizations.dart';
import 'package:flutter_my_app/common/UserModel.dart';
import 'package:flutter_my_app/models/user.dart';
import 'package:flutter_my_app/widgets/show.dart';
import 'package:provider/provider.dart';

class LoginRoute extends StatefulWidget {
  LoginRoute({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdConterller = new TextEditingController();
  bool pwdShow = false; //密码是否显示明文
  GlobalKey _formKey = new GlobalKey<FormState>();
  bool _nameAutoFocus = true;


  @override
  void initState() {
    _unameController.text = Global.profile.lastLogin;
    if(_unameController.text.length != 0){
      _nameAutoFocus = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var gm = GmLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('ha'),),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: _nameAutoFocus,   //true自动获取焦点
                controller: _unameController,
                decoration: InputDecoration(
                  labelText:'用户名',
                  hintText: '用户名',
                  prefixIcon: Icon(Icons.person),
                ),
                //校验用户名  不能为空
                validator: (v){
                  return v.trim().isNotEmpty ? null : '不能为空';
                },
              ),
              TextFormField(
                autofocus: !_nameAutoFocus,
                controller: _pwdConterller,
                decoration: InputDecoration(
                  labelText: '密码',
                  hintText: '密码',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(pwdShow ? Icons.visibility_off : Icons.visibility),
                    onPressed: (){
                      setState(() {
                        pwdShow = !pwdShow;
                      });
                    },
                  ),
                ),
                obscureText: !pwdShow,
                //校验密码 不能为空
                validator: (v){
                  return v.trim().isNotEmpty ? null : '密码不能为空';
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top:25),
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(height: 55.0),
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: _onLogin,
                    textColor: Colors.white,
                    child: Text('ddd'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _onLogin() async{
    //提交前  先验证各个表单字段是否合法
    if((_formKey.currentState as FormState).validate()){
      showLoading(context);
      User user;
      try{
        user = await Git(context).login(_unameController.text, _pwdConterller.text);
        //因为登录页返回后，首页会build,所以我们传false,更新user后不触发更新
        Provider.of<UserModel>(context,listen: false).user = user;
      }catch(e){
        if(e.response?.status == 401){
          showToast('登录失败');
        }else{
          showToast(e.toString());
        }
      }finally{
        //隐藏loading框
       Navigator.of(context).pop();
      }
      if(user != null){
        //返回
        Navigator.of(context).pop();
      }
    }

  }

}