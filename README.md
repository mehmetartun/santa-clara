# Santa Clara

![Santa Clara](/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-83.5x83.5@2x.png)

Template for the CSEN268 Final Project with Flutter and Firebase

[Web App](https://csen268-f24-g0.firebaseapp.com/images)

The documentation for this repo is in [docs](/docs)

1. [App Structure](/docs/AppStructure.md)
2. [Firebase](/docs/Firebase.md)
3. [Theme](/docs/Theme.md)
4. [Launcher Icons](/docs/LauncherIcons.md)
5. [GoRouter](/docs/Router.md)
6. [Bottom Navigation](/docs/BottomNavigation.md)
7. [Authentication Bloc](/docs/AuthenticationBloc.md)
8. [Firebase UI Auth](/docs/FirebaseUIAuth.md)
9. [Firestore](/docs/Firestore.md)\
10. [Authentication Repository](/docs/AuthenticationRepository.md)

## Important info on creating Flutter apps with Firebase

When you're creating an app in Firebase you will specify a **package name** for Android, and **bundle ID** for iOS apps. 
Ideally these should in the form of a reverse company url. If the company web address is **tesla.com** and the app you're building is for the tesla service stations you could use the name **com.tesla.service**. Then if the same company builds an app for drivers of the cars **com.tesla.driver** would be a sensible name. 

If you want to create an app with **com.tesla.driver** then do the following in the terminal:
```zsh
mkdir driver
cd driver
flutter create . --org tesla.com
```
This will create the android and iOS files accordingly with a namespace of **com.tesla.driver**. 

## Configuring Firebase Options file

First, login to firebase and also set up the CLI for FlutterFire.
```zsh
firebase login
dart pub global activate flutterfire_cli
```
Then execute flutterfire:
```zsh
flutterfire configure -a com.tesla.driver -i com.tesla.driver
```
following from the above example. These bundle ID and package name's must match the app's you defined in Firebase earlier.

You should now have `firebase_options.dart` next to your file `main.dart`. More at [Firebase](/docs/Firebase.md)






