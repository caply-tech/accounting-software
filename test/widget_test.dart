import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:accounting_software/main.dart';

void main() {
  testWidgets('App boots to the sign-in screen', (WidgetTester tester) async {
    await tester.pumpWidget(const AccountingSoftwareApp());
    await tester.pump();

    expect(find.text('Sign in to your account'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Sign In'), findsOneWidget);
  });
}
