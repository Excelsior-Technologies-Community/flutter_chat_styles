import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_chat_styles/flutter_chat_styles.dart';

void main() {
  testWidgets('ChatScreen loads MessageInput', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ChatScreen()));

    expect(find.byType(MessageInput), findsOneWidget);
  });
}
