import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rules_app/ui/equity/screen/equity_screen.dart';
import 'package:rules_app/ui/productivity_chart/screen/productivity_chart_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return const MaterialApp(home: Material(child: EquityScreen()));
  }
}
