import 'package:flutter/material.dart';
import 'ui/screens/dashboard_screen.dart';

void main() {
  runApp(HoneypotSimulationApp());
}

class HoneypotSimulationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Honeypot Simulation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardScreen(),
    );
  }
}