import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/honeypot_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HoneypotService(dionaeaUrl: 'http://localhost:8080', cowrieUrl: 'http://localhost:2222'),
      child: MaterialApp(
        title: 'Honeypot Simulation',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: DashboardScreen(),
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final honeypotService = Provider.of<HoneypotService>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Honeypot Dashboard')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                await honeypotService.startDionaea();
              },
              child: Text('Start Dionaea'),
            ),
            ElevatedButton(
              onPressed: () async {
                await honeypotService.stopDionaea();
              },
              child: Text('Stop Dionaea'),
            ),
            ElevatedButton(
              onPressed: () async {
                await honeypotService.startCowrie();
              },
              child: Text('Start Cowrie'),
            ),
            ElevatedButton(
              onPressed: () async {
                await honeypotService.stopCowrie();
              },
              child: Text('Stop Cowrie'),
            ),
            ElevatedButton(
              onPressed: () async {
                String logs = await honeypotService.fetchDionaeaLogs();
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Dionaea Logs'),
                    content: SingleChildScrollView(child: Text(logs)),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Close'),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                );
              },
              child: Text('View Dionaea Logs'),
            ),
            ElevatedButton(
              onPressed: () async {
                String logs = await honeypotService.fetchCowrieLogs();
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Cowrie Logs'),
                    content: SingleChildScrollView(child: Text(logs)),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Close'),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                );
              },
              child: Text('View Cowrie Logs'),
            ),
          ],
        ),
      ),
    );
  }
}