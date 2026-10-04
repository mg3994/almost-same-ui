import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:microsoft_store_ui/widgets/pinterest_login_dialog.dart';

void main() {
  testWidgets('PinterestLoginDialog renders dual-column content', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: PinterestLoginDialog(),
        ),
      ),
    );

    expect(find.text('Welcome to Pinterest'), findsOneWidget);
    expect(find.text('Log in to discover more ideas just for you'), findsOneWidget);
    expect(find.text('Continue with Google'), findsOneWidget);
    expect(find.text('New to Pinterest? '), findsOneWidget);
    expect(find.text('Join for free'), findsOneWidget);
    expect(find.textContaining('log in instantly'), findsOneWidget);
  });
}
