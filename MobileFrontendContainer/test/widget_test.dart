import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:notes_app_mobile/app.dart';

void main() {
  testWidgets('App renders Notes App title', (WidgetTester tester) async {
    await tester.pumpWidget(const NotesApp());
    expect(find.text('Notes App'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}
