# my_sangamner

A Flutter application for exploring Sangamner city content, community forums, local business listings, and tourism information.

## Project Overview

`my_sangamner` is a mobile app built with Flutter and Firebase. It provides:

- User registration and login with Firebase Authentication
- A home dashboard with featured banners and categories
- Community forum access
- Local business directory
- Tourist spot and city discovery
- Drawer menu with profile editing, seller onboarding, About Us, and logout

## Key Features

- Firebase Authentication for secure signup and login
- Firebase Firestore integration for app data
- Bottom navigation for Home, Community, and Business sections
- Drawer navigation with user actions and settings
- Carousel banners and media-rich city content
- Multiple content modules such as Education, Garden, Office, and Tourism

## App Screens

- `MyHomePage` - initial screen with signup and login navigation
- `LoginScreen` - email/password login with forgot password support
- `Homescreen` - main app dashboard with bottom navigation
- `Communityscreen` - community forum section
- `Businessscreen` - local business listings
- `ExploreContent` and related content screens for education, gardens, offices, and tourist spots
- Drawer pages: `EditProfileScreen`, `SellerOnboardingScreen`, `AboutUsScreen`

## Technologies Used

- Flutter 3.x
- Dart 3.x
- Firebase Core
- Firebase Auth
- Cloud Firestore
- Carousel Slider
- Image Picker
- Image Cropper
- Google Fonts
- Iconsax
- Flutter Rating Bar
- Toast notifications

## Dependencies

Important dependencies are defined in `pubspec.yaml`:

- `cupertino_icons`
- `carousel_slider`
- `iconsax`
- `image_cropper`
- `lorem_ipsum`
- `image_picker`
- `flutter_rating_bar`
- `google_fonts`
- `firebase_core`
- `firebase_auth`
- `cloud_firestore`
- `ui_helper`
- `toast`

## Setup & Run

1. Install Flutter SDK and set up an emulator or device.
2. Open the project folder in your editor.
3. Run:

```bash
flutter pub get
flutter run
```

4. Make sure Firebase is configured for Android/iOS via `firebase_options.dart`.

## Project Structure

- `lib/main.dart` - app entry point and Firebase initialization
- `lib/homelogin.dart` - signup/login entry page
- `lib/loginscreen.dart` - login flow
- `lib/homepage.dart` - main dashboard and navigation
- `lib/content/` - category content modules
- `lib/drawerscreens/` - drawer menu screens
- `lib/view/` - community, business, and tourist screens
- `assets/images/` - app images and banners

## Notes

- The initial route is configured to check Firebase user state before navigating to the home screen.
- The app supports asset-based content and can be extended with Firestore data for dynamic listings.
- Use `flutter pub upgrade` to update dependencies when needed.
