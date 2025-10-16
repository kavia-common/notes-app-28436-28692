# Quick Start Guide - Notes App Mobile Frontend

## 🚀 Get Started in 3 Steps

### Step 1: Install Dependencies
```bash
cd MobileFrontendContainer
flutter pub get
```

### Step 2: Run the App
```bash
# Option A: Run on Android emulator/device
flutter run

# Option B: Build debug APK
flutter build apk --debug

# The APK will be at: build/app/outputs/flutter-apk/app-debug.apk
```

### Step 3: Start Using!
- Tap the **+** button to create your first note
- Enter a title and content
- Tap **Generate Summary** to create a summary
- Tap **Save Note** to store it locally

---

## 📱 What You Can Do

✅ **Create Notes** - Add unlimited notes with titles and content  
✅ **Edit Notes** - Tap any note to edit it  
✅ **Delete Notes** - Use the 3-dot menu to remove notes  
✅ **Generate Summaries** - Get AI-powered or local summaries  
✅ **Offline Mode** - Works without internet connection  
✅ **Auto-Save** - Notes saved locally automatically  

---

## 🌐 Connect to Backend (Optional)

To enable backend synchronization and AI summaries:

1. Create a `.env` file:
```bash
cp .env.example .env
```

2. Edit `.env` and add your backend URL:
```
BACKEND_URL=https://your-backend-api-url.com
```

3. Restart the app

**Backend Features:**
- Cloud synchronization
- Advanced AI summarization
- Multi-device sync

---

## 🎯 App Features

### Main Screen
- **List View**: See all your notes in a scrollable list
- **Cloud Icon**: Shows backend connection status (green = online, grey = offline)
- **Refresh Icon**: Manually refresh notes from backend
- **FAB (+)**: Create new note

### Note Editor
- **Title Field**: Required, enter note title
- **Content Field**: Required, enter note text
- **Generate Summary**: Create a summary of your note
- **Save Button**: Persist the note

### Note Card
- **Title**: Large, bold text
- **Content Preview**: First 3 lines visible
- **Summary Badge**: Shows AI-generated summary if available
- **Date**: Formatted creation date
- **Menu**: Access delete option

---

## 💡 Tips

1. **Offline First**: The app works perfectly without internet
2. **Pull to Refresh**: Swipe down on the notes list to refresh
3. **Auto-Summary**: Generate summaries before saving for best experience
4. **Confirm Delete**: Always asks before deleting a note
5. **Unsaved Changes**: Warns if you try to exit without saving

---

## 🔧 Troubleshooting

### App won't run?
```bash
flutter clean
flutter pub get
flutter run
```

### Backend not connecting?
- Check your `.env` file has correct `BACKEND_URL`
- Verify backend is running and accessible
- Look for cloud icon - grey means offline, green means connected

### Build errors?
```bash
# Clear build cache
flutter clean

# Verify Flutter setup
flutter doctor

# Reinstall dependencies
rm pubspec.lock
flutter pub get
```

---

## 📊 System Requirements

- **Flutter SDK**: 3.7.0 or higher
- **Android**: API level 21+ (Android 5.0+)
- **iOS**: iOS 12.0+ (if building for iOS)
- **Storage**: ~50MB for app + data

---

## 📞 Support

For issues or questions:
1. Check the detailed README.md in MobileFrontendContainer/
2. Verify all prerequisites are installed
3. Check Flutter doctor: `flutter doctor -v`

---

## 🎉 You're Ready!

The app is now ready to use. Start creating notes and explore all features!

```bash
flutter run
```

Happy note-taking! 📝
