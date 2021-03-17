import 'package:flutter/material.dart';

class WelComeTextWidget extends StatefulWidget {
  @override
  _WelComeTextWidgetState createState() => _WelComeTextWidgetState();
}

class _WelComeTextWidgetState extends State<WelComeTextWidget>  with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation _animation;
  
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this,duration: Duration(seconds:2 ));
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
    _animationController.forward();
  }
@override
  void dispose() {
     super.dispose();
     _animationController.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    _animationController.forward();
    return Center(
      child: Text(
        "Welcome to energy App",
        overflow: TextOverflow.fade,
        style: TextStyle(
        color: Colors.amberAccent,
        letterSpacing: 2.0,
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),),
    );
  }
}
