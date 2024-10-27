import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/honeypot_service.dart';
import 'ui/dashboard_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HoneypotService(
        dionaeaUrl: 'http://localhost:8080', // Adjust as needed
        cowrieUrl: 'http://localhost:2222',   // Adjust as needed
      ),
      child: MaterialApp(
        title: 'Honeypot Simulation',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: DashboardScreen(),
      ),
    );
  }
}