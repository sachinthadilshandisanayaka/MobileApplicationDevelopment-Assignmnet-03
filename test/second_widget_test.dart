
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_testing/second.dart';

void main() {
  testWidgets('Display String test', (WidgetTester tester) async {
    await tester.pumpWidget(SecondActivity());
    var textFormField = find.byKey(Key('input-name-field'));
    expect(textFormField, findsOneWidget);
    await tester.enterText(textFormField, "Sachintha");
    expect(find.text('Sachintha'), findsOneWidget);
    var button = find.text('Send');
    expect(button, findsOneWidget);
    await tester.tap(button);
    await tester.pump();
    expect(find.text('Sachintha'), findsWidgets);
  });
}
