import 'package:flutter_test/flutter_test.dart';
import 'package:microsoft_store_ui/main.dart';

void main() {
  testWidgets('App renders main Microsoft Store UI', (WidgetTester tester) async {
    await tester.pumpWidget(const MicrosoftStoreApp());
    expect(find.text('Microsoft Store UI'), findsOneWidget);
    expect(find.text('Get updates'), findsOneWidget);
  });
}
