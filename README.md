# Santa Clara

Template for the CSEN268 Final Project with Flutter and Firebase

## App Structure

The App is structured with a bottom navigation bar and uses routing with **go_router** package.

![App Structure](/docs/images/AppStructure.png)

## Firebase

This template uses two Firebase services
- Firebase Authentication
- Cloud Firestore

### Firebase Apps

In Firebase we created three apps: **iOS**, **Android**, and **Web**. Each of these apps are represented in the [firebase_options.dart](/lib/firebase_options.dart) file. The App will chose which configuration to use depending on the current platform using the native `TargetPlatform` enum. 

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



