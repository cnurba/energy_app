import 'package:energy_app/ui/widgets/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double pos = size.height;
     return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundContainer(size),
          WelComeTextWidget(),
        ],
      )
    );
  }

  Widget _buildBackgroundContainer(Size size){
    return Column(
      children: [
        Container(
          height: size.height/2,
          decoration: BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.center,
              image: Image.asset("assets/logo.png").image,
              scale: 2,
            ),
            color: Colors.white,
          ),
        ),
        Container(
          height: size.height/2,
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.greenAccent,
          ),
          child: Icon(Icons.lightbulb_outline,color: Colors.yellow,size: 100,),
        )
      ],
    );
  }

}
