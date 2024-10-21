class Interaction {
  final String ipAddress;
  final String timestamp;
  final String service;

  Interaction({
    required this.ipAddress,
    required this.timestamp,
    required this.service,
  });

  @override
  String toString() {
    return 'IP: $ipAddress, Time: $timestamp, Service: $service';
  }
}