import 'package:energy_app/ui/menu/home_menu.dart';
import 'package:flutter/material.dart';

class SubstationListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text('ТП тизмеси'),
    ),
      body:HomeMenu(),

      /*ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('TП № $index'),
            subtitle: Text('Ул.Кожожаш 35'),
            leading: Icon(Icons.lightbulb_outline),
            trailing: Text('${index+5}'),
          );
        },

      )*/
    );
  }
}
