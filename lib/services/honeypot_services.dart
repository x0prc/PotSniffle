import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class HoneypotService with ChangeNotifier {
  final String dionaeaUrl;
  final String cowrieUrl;

  HoneypotService({required this.dionaeaUrl, required this.cowrieUrl});

  Future<void> startDionaea() async {
    await http.post(Uri.parse('$dionaeaUrl/start'));
    notifyListeners();
  }

  Future<void> stopDionaea() async {
    await http.post(Uri.parse('$dionaeaUrl/stop'));
    notifyListeners();
  }

  Future<void> startCowrie() async {
    await http.post(Uri.parse('$cowrieUrl/start'));
    notifyListeners();
  }

  Future<void> stopCowrie() async {
    await http.post(Uri.parse('$cowrieUrl/stop'));
    notifyListeners();
  }

  Future<String> fetchDionaeaLogs() async {
    final response = await http.get(Uri.parse('$dionaeaUrl/logs'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load Dionaea logs');
    }
  }

  Future<String> fetchCowrieLogs() async {
    final response = await http.get(Uri.parse('$cowrieUrl/logs'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load Cowrie logs');
    }
  }
}