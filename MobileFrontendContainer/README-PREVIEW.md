# Flutter Preview Notes

- SDK constraints relaxed to support common preview environments.
- Minimal app is provided at lib/main.dart with a simple UI.
- No build_runner or pre/post-install hooks are used.
- If environment variables are needed in the future, use flutter_dotenv and add `.env` under assets.

Typical commands:
  flutter pub get
  flutter build apk --debug
  flutter test

If web is not supported in the preview environment, do not attempt `flutter run -d chrome`; use Android build targets instead.
