import 'package:flutter/material.dart';

class HomeMenu extends StatefulWidget {
  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> with SingleTickerProviderStateMixin {

  late AnimationController _menuController;

  @override
  void initState() {
     super.initState();
     _menuController = AnimationController(vsync: this,duration: Duration(
       milliseconds: 300,
     ),
     );
  }

  void onTap(BuildContext context){
    OverlayEntry entry = OverlayEntry(

      builder: (context) {
      return Positioned(
        width: 100,
        height: 100,
        left: 100,
        child: Text('Привет',style: TextStyle(
          color: Colors.red,fontSize: 25.0,
        ),),
      );
    },);

    OverlayState overlayState = OverlayState(

    );
    overlayState.insert(entry);

  }

  @override
  Widget build(BuildContext context) {
    return Flow(
      children: [
        CircleAvatar(
          child: IconButton(
            color: Colors.blue,
            tooltip: 'Привет',

            icon: Icon(Icons.height,color: Colors.red,),
            onPressed: (){
              (_menuController.status == AnimationStatus.completed)?_menuController.reverse():_menuController.forward();

            },
          ),
        ),
        IconButton(
          color: Colors.blue,
          icon: Icon(Icons.add,color: Colors.red,),
          onPressed: (){
            onTap(context);
          },
        ),
        IconButton(
          color: Colors.blue,
          icon: Icon(Icons.list,color: Colors.red,),
          onPressed: (){
            (_menuController.status == AnimationStatus.completed)?_menuController.reverse():_menuController.forward();
          },
        ),

       ],
      delegate: _HomeFlowDelegate(
          animation:_menuController,
      ),
    );
  }
}

class _HomeFlowDelegate extends FlowDelegate {
  const _HomeFlowDelegate({required this.animation}):super(repaint: animation);
  final Animation<double> animation;

  @override
  void paintChildren(FlowPaintingContext context) {
    double dy = 0.0;

    for (int i = 0; i < context.childCount; i++) {
      dy = context.getChildSize(i)!.height*i;
      context.paintChild(
        i,
        transform: Matrix4.translationValues(
          0.0,
          dy*animation.value,
          0.0,
        ),
      );
    }
  }

  @override
  bool shouldRepaint(covariant _HomeFlowDelegate oldDelegate) {
    return animation != oldDelegate.animation;
  }
}

class Overlay extends StatefulWidget {
  @override
  _OverlayState createState() => _OverlayState();
}

class _OverlayState extends State<Overlay> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
