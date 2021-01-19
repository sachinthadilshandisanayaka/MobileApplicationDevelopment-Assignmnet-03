import 'package:flutter_test/flutter_test.dart';
import 'package:widget_testing/second.dart';

void main() {
  test("String diplay is text box", () {
    String myname = "Sachintha";
    String getData = getInputData(myname);
    expect(myname, getData);
  });
}
