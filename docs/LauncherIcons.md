# Creating Launcher Icons for Mobile and Web

A package called [Flutter Launcher Icons](https://pub.dev/packages/flutter_launcher_icons) is helpful in creating icons for iOS, Android, and Web.

1. Find the image you want to use as icon, in 1000x1000 resolution as a **.png** file.
2. Place this file in the directory `/assets/icons/<your-icon-image.png>` as here [assets/icons/launcher_icon.png](assets/icons/launcher_icon.png)
3. Place the icon for the web in `/web/icons/launcher_icon.png` as here [web/icons/launcher_icon.png](/web/icons/launcher_icon.png)
4. In the `pubspec.yaml` file enter the following
```yaml
flutter_launcher_icons:
  image_path: "assets/icons/launcher_icon.png"
  android: true
  ios: true
  web:
    generate: true
    image_path: "web/icons/launcher_icon.png"
    background_color: "#FFFFFF"
    theme_color: "#FFFFFF"
```
5.  Enter the following command
```zsh
dart run flutter_launcher_icons
```

Your icons will now be created and placed in appropriate directories