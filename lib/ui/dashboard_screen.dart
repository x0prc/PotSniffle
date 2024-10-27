import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/honeypot_service.dart';

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
                _showLogsDialog(context, 'Dionaea Logs', logs);
              },
              child: Text('View Dionaea Logs'),
            ),
            ElevatedButton(
              onPressed: () async {
                String logs = await honeypotService.fetchCowrieLogs();
                _showLogsDialog(context, 'Cowrie Logs', logs);
              },
              child: Text('View Cowrie Logs'),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogsDialog(BuildContext context, String title, String logs) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(child: Text(logs)),
        actions: <Widget>[
          TextButton(
            child: Text('Close'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}