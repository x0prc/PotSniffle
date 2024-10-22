import 'dart:convert';
import 'package:http/http.dart' as http;

class HoneypotService {
  final String dionaeaUrl;
  final String cowrieUrl;

  HoneypotService({required this.dionaeaUrl, required this.cowrieUrl});

  Future<void> startDionaea() async {
    // Example command to start Dionaea
    await http.post(Uri.parse('$dionaeaUrl/start'));
  }

  Future<void> stopDionaea() async {
    await http.post(Uri.parse('$dionaeaUrl/stop'));
  }

  Future<void> startCowrie() async {
    await http.post(Uri.parse('$cowrieUrl/start'));
  }

  Future<void> stopCowrie() async {
    await http.post(Uri.parse('$cowrieUrl/stop'));
  }

  Future<String> fetchDionaeaLogs() async {
    final response = await http.get(Uri.parse('$dionaeaUrl/logs'));
    return response.body;
  }

  Future<String> fetchCowrieLogs() async {
    final response = await http.get(Uri.parse('$cowrieUrl/logs'));
    return response.body;
  }
}