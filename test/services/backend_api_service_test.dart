import 'package:flutter_test/flutter_test.dart';
import 'package:wpgg/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('BackendApiServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
