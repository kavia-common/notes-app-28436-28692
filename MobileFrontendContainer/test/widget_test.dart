import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:MobileFrontendContainer/services/notes_service.dart';
import 'package:MobileFrontendContainer/screens/notes_screen.dart';

void main() {
  setUpAll(() async {
    // Initialize dotenv for tests with empty environment
    TestWidgetsFlutterBinding.ensureInitialized();
    dotenv.testLoad(fileInput: 'BACKEND_URL=');
  });

  testWidgets('App starts and shows Notes screen', (WidgetTester tester) async {
    final notesService = NotesService();
    
    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: notesService,
        child: MaterialApp(
          home: const NotesScreen(),
        ),
      ),
    );
    
    // Wait for initialization
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    // Verify the app bar title
    expect(find.text('My Notes'), findsOneWidget);
    
    // Verify the FAB is present
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });

  testWidgets('Empty state message is displayed when no notes', (WidgetTester tester) async {
    final notesService = NotesService();
    
    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: notesService,
        child: MaterialApp(
          home: const NotesScreen(),
        ),
      ),
    );
    
    // Wait for initialization
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    // Should show empty state
    expect(find.text('No notes yet'), findsOneWidget);
    expect(find.text('Tap + to create your first note'), findsOneWidget);
  });

  testWidgets('FAB button exists and is tappable', (WidgetTester tester) async {
    final notesService = NotesService();
    
    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: notesService,
        child: MaterialApp(
          home: const NotesScreen(),
        ),
      ),
    );
    
    // Wait for initialization
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    // Verify FAB exists
    expect(find.byType(FloatingActionButton), findsOneWidget);
    
    // Verify it has an add icon
    expect(find.descendant(
      of: find.byType(FloatingActionButton),
      matching: find.byIcon(Icons.add),
    ), findsOneWidget);
  });
}
