import 'package:flutter_test/flutter_test.dart';
import 'package:wpgg/ui/views/home/home_viewmodel.dart';

void main() {
  group('HomeViewModel Tests -', () {
    test('model instantiates properly', () {
      final model = HomeViewModel();
      expect(model, isNotNull);
    });
  });
}
