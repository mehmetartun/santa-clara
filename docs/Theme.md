# Material Theme

The material3 theme can be designed in Figma and exported for flutter. The resultimg `theme.dart` and `util.dart` files need to be placed at `lib/theme/` as [theme.dart](/lib/theme/theme.dart) and [util.dart](/lib/theme/util.dart).

## Google Fonts

The `google_fonts` package is imported allowing the use of Google Fonts. The `TextTheme` is built using Google Fonts and merged with the color scheme.

## Theme cubit

This cubit allows for the app to be rebuilt with a new color scheme. It's `BlocBuilder` is placed above the `MaterialApp` and rebuilds the app on `ThemeState` changes. In this implementation, the `MaterialApp` has both the `light` and `dark` themes defined and the switching follows by setting the `themeMode` property to `light`, `dark`, or `system`. 

![Theme Switching](/docs/images/ThemeSwitching.gif)

The implementation in [main.dart](/lib/main.dart) is shown below where the `themeMode` property of the `MaterialApp` is linked to the `themeMode` of the `ThemeState` of the `ThemeCubit`:
```dart
class MyApp extends StatelessWidget {
    ...
  @override
  Widget build(BuildContext context) {
    ...
    TextTheme textTheme =
        createTextTheme(context, "Roboto", "Playfair Display");

    MaterialTheme theme = MaterialTheme(textTheme);
    ...
          BlocProvider(
            create: (context) => ThemeCubit(),
          ),
        ],
    ...
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return MaterialApp.router(
                ...
                theme: theme.light(),
                darkTheme: theme.dark(),
                highContrastTheme: theme.lightHighContrast(),
                highContrastDarkTheme: theme.darkHighContrast(),
                themeMode: state.themeMode,
                ...
}
```
