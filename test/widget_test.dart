import 'package:contact_list/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('renders the contact list UI', (tester) async {
    await tester.pumpWidget(const ContactListApp());

    expect(find.text('Contact List'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.widgetWithText(ElevatedButton, 'Add'), findsOneWidget);
    expect(find.text('Jawad'), findsOneWidget);
    expect(find.text('Ferdous'), findsOneWidget);
    expect(find.text('01877-777777'), findsOneWidget);
  });
}
