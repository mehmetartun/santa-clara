# Firebase

This template uses two Firebase services
- Firebase Authentication
- Cloud Firestore

## Obfuscated files - IMPORTANT!
The firebase connection credentials that are normally found in these files below have been added to `.gitignore`. It's highly recommended that this info is not published to a public repo. When you pull this repo to build your application, you must place the corresponding files in their place.
```
/lib/firebase_options.dart
/ios/Runner/GoogleService-Info.plist
/android/app/google-services.json
```

## Firebase Apps

In Firebase we created three apps: **iOS**, **Android**, and **Web**. Each of these apps are represented in the `lib/firebase_options.dart` file. The App will chose which configuration to use depending on the current platform using the native `TargetPlatform` enum. 

Firebase is initialized in [main.dart](/lib/main.dart)

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  ...
  runApp(MyApp());
}
```

## Use flutterfire-cli to create firebase_options.dart

To be filled in.

## Setting Up Hosting

Login to firebase 
    firebase login
and once you're logged in
    firebase init
Choose the **Hosting** option and state `build/web` as your public directory when asked. Answer the defaults to the other questions.
![Firebase Init](/docs/images/FirebaseInit.png)
![Firebase Init 2](/docs/images/FirebaseInit2.png)

You should now see a file [.firebaserc](/.firebaserc) created and hosting details added to your [firebase.json](/firebase.json) file.