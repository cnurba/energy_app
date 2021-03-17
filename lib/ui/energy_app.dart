import 'package:energy_app/ui/log_screen/login_screen.dart';
import 'package:energy_app/ui/log_screen/splash_screen.dart';
import 'package:energy_app/ui/substation/substation_screen.dart';
import 'package:flutter/material.dart';

import 'menu/home_menu.dart';



class EnergyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SubstationListPage(),
    );
  }
}
