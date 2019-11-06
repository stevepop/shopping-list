// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_list/sceens/home.dart';

void main() {
  testWidgets('HomeScreen has a title', (WidgetTester tester) async {
    await tester.pumpWidget(HomeScreen());

    // Create the Finders.
    final titleFinder = find.text('Family Shopping List');
    print(titleFinder.evaluate().first);

    // Use the `findsOneWidget` matcher provided by flutter_test to verify
    // that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
  });
}
