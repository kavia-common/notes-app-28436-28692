# Notes App - Mobile Frontend Container (Minimal)

This container contains a minimal Flutter notes app that:
- Lets you enter Title and Content
- Taps "Summarize & Save" to generate a summary (via backend if configured, else local fallback)
- Saves notes locally with shared_preferences
- Shows a scrollable list of saved notes (title + summary)
- Requires no authentication and runs without any setup

## Run
```bash
cd MobileFrontendContainer
flutter pub get
flutter run
```

## Optional backend
Create `MobileFrontendContainer/.env`:
```
BACKEND_API_URL=https://your-backend.example.com
# or
BACKEND_URL=https://your-backend.example.com
```
If not provided, the app works fully offline.

## Tests
```bash
flutter test
```

## Files of interest
- MobileFrontendContainer/lib/main.dart — UI and local persistence
- MobileFrontendContainer/lib/services/api.dart — Simple API helper

This minimal implementation is optimized for preview stability and offline use.
