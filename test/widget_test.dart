import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:food_app/main.dart';

void main() {
  testWidgets('App loads and shows home/menu/login screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Login'), findsOneWidget);
  });
}
