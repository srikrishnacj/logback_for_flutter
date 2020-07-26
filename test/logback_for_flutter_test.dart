import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logback_for_flutter/logback_for_flutter.dart';

void main() {
  const MethodChannel channel = MethodChannel('logback_for_flutter');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await LogbackForFlutter.platformVersion, '42');
  });
}
