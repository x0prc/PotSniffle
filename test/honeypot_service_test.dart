import 'package:flutter_test/flutter_test.dart';
import 'package:honeypot_simulation/services/honeypot_service.dart';

void main() {
  group('HoneypotService', () {
    test('should log interactions when started', () async {
      final service = HoneypotService();
      await service.start();

      // Allow some time for logging to occur
      await Future.delayed(Duration(seconds: 6));

      expect(service.getInteractions().length, greaterThan(0));

      await service.stop();
    });
  });
}