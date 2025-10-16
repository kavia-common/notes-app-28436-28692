# MobileFrontendContainer - Notes App

A minimal Flutter mobile application for creating, managing, and summarizing notes. The app works both online (with backend) and offline (local storage only).

## Features

- ✅ Create and edit notes with title and content
- ✅ Generate AI-powered summaries (backend) or simple extractive summaries (offline)
- ✅ Save notes locally using `shared_preferences`
- ✅ Sync with backend API when available
- ✅ Offline-first architecture with graceful fallback
- ✅ Clean Material Design UI
- ✅ Real-time backend connection status indicator
- ✅ Delete notes with confirmation
- ✅ Responsive list view with formatted dates

## Architecture

### Local Storage
- Uses `shared_preferences` for persisting notes locally
- All notes are saved to local storage regardless of backend availability
- App works fully offline without backend

### Backend Integration
- Optional backend connection via configurable `BACKEND_URL` environment variable
- Automatically detects backend availability on startup
- Falls back to local operations when backend is unavailable
- Uses `http` package for REST API calls

### Summarization
- **Online**: Calls backend API for AI-powered summarization
- **Offline**: Uses local extractive summarization (first 2-3 sentences or truncated text)

## Prerequisites

- Flutter SDK (3.7.0 or higher)
- Dart SDK (3.7.0 or higher)
- Android SDK (for Android) or Xcode (for iOS)

## Installation

1. **Install dependencies:**
   ```bash
   flutter pub get
   ```

2. **Configure environment (optional):**
   
   Create a `.env` file in the project root:
   ```bash
   cp .env.example .env
   ```
   
   Edit `.env` and set your backend URL:
   ```
   BACKEND_URL=https://your-backend-api-url.com
   ```
   
   **Note**: If no `.env` file is provided or `BACKEND_URL` is empty, the app runs in offline-only mode.

## Running the App

### Android

```bash
# Run on connected device or emulator
flutter run

# Build APK
flutter build apk

# Build App Bundle (for Play Store)
flutter build appbundle
```

### iOS

```bash
# Run on connected device or simulator
flutter run

# Build for release
flutter build ios
```

### Debug Mode

```bash
# Run with hot reload
flutter run

# Run on specific device
flutter devices  # List available devices
flutter run -d <device-id>
```

## Project Structure

```
lib/
├── main.dart                      # App entry point
├── models/
│   └── note.dart                  # Note data model
├── services/
│   ├── api_client.dart            # Backend API client
│   ├── notes_service.dart         # Notes business logic & state management
│   └── local_summarizer.dart     # Offline summarization fallback
└── screens/
    ├── notes_screen.dart          # Main notes list screen
    └── note_editor_screen.dart    # Create/edit note screen
```

## Usage

### Creating a Note

1. Tap the **+** floating action button on the main screen
2. Enter a title and content
3. (Optional) Tap **Generate Summary** to create a summary
4. Tap **Save Note** to persist the note

### Viewing and Editing Notes

1. Tap on any note card in the list
2. Edit the title or content
3. Tap **Update Note** to save changes

### Deleting a Note

1. Tap the three-dot menu on a note card
2. Select **Delete**
3. Confirm the deletion

### Backend Status

- **Green cloud icon** in app bar: Backend connected
- **Grey cloud icon** in app bar: Offline mode (local storage only)
- Tap the cloud icon to see current connection status

## Environment Variables

| Variable | Description | Required |
|----------|-------------|----------|
| `BACKEND_URL` | Base URL of the backend API | No (defaults to offline mode) |

## API Integration

When `BACKEND_URL` is configured, the app connects to these endpoints:

- `GET /` - Health check
- `GET /notes` - Fetch all notes
- `POST /notes` - Create new note
- `PUT /notes/{id}` - Update note
- `DELETE /notes/{id}` - Delete note
- `POST /notes/{id}/summarize` - Generate summary

All API calls have 10-second timeouts and gracefully handle errors.

## Testing

Run unit and widget tests:

```bash
flutter test
```

## Troubleshooting

### App crashes on startup
- Ensure Flutter SDK is properly installed: `flutter doctor`
- Clear build cache: `flutter clean && flutter pub get`

### Backend not connecting
- Verify `BACKEND_URL` in `.env` is correct and accessible
- Check network connectivity
- App will work offline if backend is unavailable

### Dependencies not installing
- Update Flutter: `flutter upgrade`
- Clean and reinstall: `flutter clean && flutter pub get`

## Build Configuration

### Android
- Minimum SDK: 21 (Android 5.0)
- Target SDK: 34

### iOS
- Minimum iOS version: 12.0

## License

This project is part of the Notes App multi-container architecture.
