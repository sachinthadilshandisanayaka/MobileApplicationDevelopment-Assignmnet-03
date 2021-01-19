import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('flutter display string test', () {
    FlutterDriver fd;
    setUpAll(() async {
      fd = await FlutterDriver.connect();
    });
    tearDownAll(() {
      if (fd != null) {
        fd.close();
      }
    });
  });
}
