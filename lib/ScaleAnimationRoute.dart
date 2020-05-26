import 'package:flutter/material.dart';

class ScaleAnimationRoute extends StatefulWidget {
  ScaleAnimationRoute({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ScaleAnimationRouteState createState() => _ScaleAnimationRouteState();
}

class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.bounceIn);
    animation = new Tween(begin: 0.0, end: 300.0).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
//        body: new AnimatedImage(animation: animation,), // This trailing comma
      body: AnimatedBuilder(
          animation: animation,
          child: Image.asset('images/lake.jpg'),
          builder: (BuildContext context,Widget child){
            return Center(
              child: new Container(
                height: animation.value,
                width: animation.value,
                child: child,
              ),
            );
          }),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: Image.asset(
        'images/lake.jpg',
        width: animation.value,
        height: animation.value,
      ),
    );
  }
}
