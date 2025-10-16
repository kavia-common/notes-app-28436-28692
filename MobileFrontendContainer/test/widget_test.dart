import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:MobileFrontendContainer/main.dart' as app;

void main() {
  setUpAll(() async {
    // Initialize dotenv for tests with empty environment
    TestWidgetsFlutterBinding.ensureInitialized();
    dotenv.testLoad(fileInput: 'BACKEND_API_URL=');
  });

  testWidgets('App starts and shows My Notes title', (WidgetTester tester) async {
    await tester.pumpWidget(const app.NotesApp());
    await tester.pumpAndSettle();

    expect(find.text('My Notes'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2)); // Title and Content
    expect(find.text('Summarize & Save'), findsOneWidget);
  });

  testWidgets('Empty state initially visible after load', (WidgetTester tester) async {
    await tester.pumpWidget(const app.NotesApp());
    await tester.pump(const Duration(milliseconds: 200));

    expect(
      find.textContaining('No notes yet'),
      findsOneWidget,
    );
  });

  testWidgets('Tapping Summarize & Save with empty fields shows error', (WidgetTester tester) async {
    await tester.pumpWidget(const app.NotesApp());
    await tester.pump();

    // Tap the button
    final btn = find.widgetWithText(ElevatedButton, 'Summarize & Save');
    expect(btn, findsOneWidget);
    await tester.tap(btn);
    await tester.pump();

    // Error message should be shown
    expect(find.text('Please enter both Title and Content.'), findsOneWidget);
  });
}
