# MobileFrontendContainer - Minimal Notes App

A minimal Flutter mobile app to:
- Enter Title and Content
- Tap "Summarize & Save" which generates a summary (backend if available, else local fallback)
- Persist notes locally (offline-first) and display them in a list
- Best-effort save to backend if BACKEND_API_URL/BACKEND_URL is set (no auth)

## Quick Start
```bash
cd MobileFrontendContainer
flutter pub get
flutter run
```

Works out-of-the-box with no configuration.

## Optional Backend
If you have a backend provide one of:
- BACKEND_API_URL
- BACKEND_URL

Create `.env`:
```
BACKEND_API_URL=https://your-backend.example.com
# or
BACKEND_URL=https://your-backend.example.com
```

The app attempts POST /summarize with body: { "content": "..." } and will ignore failures.

## Features
- Offline-first with local storage (shared_preferences)
- Clean, single-screen UI
- Scrollable list of saved notes (title + summary)
- Graceful error handling and loading indicators
- No authentication

## Files
- lib/main.dart: App UI, local persistence, and flow
- lib/services/api.dart: Minimal API helper with graceful fallback
- pubspec.yaml: Minimal dependencies

## Acceptance Criteria Mapping
- Type Title/Content: TextFields at top
- Summarize & Save: Button triggers backend summarize (if configured) else local fallback; saves note locally
- List notes: ListTile shows title and summary
- No auth: None implemented
- Runs in preview w/o setup: Yes, backend optional
- Graceful handling: Errors shown inline; no unhandled exceptions

```
flutter run
```
Enjoy!
