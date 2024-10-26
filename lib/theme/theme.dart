import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4280837002),
      surfaceTint: Color(4280837002),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4291487487),
      onPrimaryContainer: Color(4278197808),
      secondary: Color(4283457647),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4292077046),
      onSecondaryContainer: Color(4278983977),
      tertiary: Color(4284831867),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4293647615),
      onTertiaryContainer: Color(4280292916),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      background: Color(4294441471),
      onBackground: Color(4279770144),
      surface: Color(4294441471),
      onSurface: Color(4279770144),
      surfaceVariant: Color(4292731882),
      onSurfaceVariant: Color(4282468173),
      outline: Color(4285692030),
      outlineVariant: Color(4290889678),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281151797),
      inverseOnSurface: Color(4293849590),
      inversePrimary: Color(4288072952),
      primaryFixed: Color(4291487487),
      onPrimaryFixed: Color(4278197808),
      primaryFixedDim: Color(4288072952),
      onPrimaryFixedVariant: Color(4278209392),
      secondaryFixed: Color(4292077046),
      onSecondaryFixed: Color(4278983977),
      secondaryFixedDim: Color(4290234841),
      onSecondaryFixedVariant: Color(4281878870),
      tertiaryFixed: Color(4293647615),
      onTertiaryFixed: Color(4280292916),
      tertiaryFixedDim: Color(4291805416),
      onTertiaryFixedVariant: Color(4283253090),
      surfaceDim: Color(4292336351),
      surfaceBright: Color(4294441471),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294046969),
      surfaceContainer: Color(4293652211),
      surfaceContainerHigh: Color(4293257453),
      surfaceContainerHighest: Color(4292928488),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278208362),
      surfaceTint: Color(4280837002),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4282546849),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281681234),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4284905093),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4282989918),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4286344850),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      background: Color(4294441471),
      onBackground: Color(4279770144),
      surface: Color(4294441471),
      onSurface: Color(4279770144),
      surfaceVariant: Color(4292731882),
      onSurfaceVariant: Color(4282205001),
      outline: Color(4284112998),
      outlineVariant: Color(4285889410),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281151797),
      inverseOnSurface: Color(4293849590),
      inversePrimary: Color(4288072952),
      primaryFixed: Color(4282546849),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4280639879),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4284905093),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4283326060),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4286344850),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4284700281),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292336351),
      surfaceBright: Color(4294441471),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294046969),
      surfaceContainer: Color(4293652211),
      surfaceContainerHigh: Color(4293257453),
      surfaceContainerHighest: Color(4292928488),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278199610),
      surfaceTint: Color(4280837002),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278208362),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4279444528),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4281681234),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4280753211),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4282989918),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      background: Color(4294441471),
      onBackground: Color(4279770144),
      surface: Color(4294441471),
      onSurface: Color(4278190080),
      surfaceVariant: Color(4292731882),
      onSurfaceVariant: Color(4280231210),
      outline: Color(4282205001),
      outlineVariant: Color(4282205001),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281151797),
      inverseOnSurface: Color(4294967295),
      inversePrimary: Color(4292734719),
      primaryFixed: Color(4278208362),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278202441),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4281681234),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4280167995),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4282989918),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4281476934),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292336351),
      surfaceBright: Color(4294441471),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294046969),
      surfaceContainer: Color(4293652211),
      surfaceContainerHigh: Color(4293257453),
      surfaceContainerHighest: Color(4292928488),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4288072952),
      surfaceTint: Color(4288072952),
      onPrimary: Color(4278203471),
      primaryContainer: Color(4278209392),
      onPrimaryContainer: Color(4291487487),
      secondary: Color(4290234841),
      onSecondary: Color(4280431167),
      secondaryContainer: Color(4281878870),
      onSecondaryContainer: Color(4292077046),
      tertiary: Color(4291805416),
      onTertiary: Color(4281740106),
      tertiaryContainer: Color(4283253090),
      onTertiaryContainer: Color(4293647615),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      background: Color(4279243799),
      onBackground: Color(4292928488),
      surface: Color(4279243799),
      onSurface: Color(4292928488),
      surfaceVariant: Color(4282468173),
      onSurfaceVariant: Color(4290889678),
      outline: Color(4287336856),
      outlineVariant: Color(4282468173),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292928488),
      inverseOnSurface: Color(4281151797),
      inversePrimary: Color(4280837002),
      primaryFixed: Color(4291487487),
      onPrimaryFixed: Color(4278197808),
      primaryFixedDim: Color(4288072952),
      onPrimaryFixedVariant: Color(4278209392),
      secondaryFixed: Color(4292077046),
      onSecondaryFixed: Color(4278983977),
      secondaryFixedDim: Color(4290234841),
      onSecondaryFixedVariant: Color(4281878870),
      tertiaryFixed: Color(4293647615),
      onTertiaryFixed: Color(4280292916),
      tertiaryFixedDim: Color(4291805416),
      onTertiaryFixedVariant: Color(4283253090),
      surfaceDim: Color(4279243799),
      surfaceBright: Color(4281743934),
      surfaceContainerLowest: Color(4278914834),
      surfaceContainerLow: Color(4279770144),
      surfaceContainer: Color(4280033316),
      surfaceContainerHigh: Color(4280691246),
      surfaceContainerHighest: Color(4281414969),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4288336380),
      surfaceTint: Color(4288072952),
      onPrimary: Color(4278196264),
      primaryContainer: Color(4284520127),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4290563549),
      onSecondary: Color(4278655012),
      secondaryContainer: Color(4286747554),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4292134124),
      onTertiary: Color(4279963695),
      tertiaryContainer: Color(4288187056),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      background: Color(4279243799),
      onBackground: Color(4292928488),
      surface: Color(4279243799),
      onSurface: Color(4294573055),
      surfaceVariant: Color(4282468173),
      onSurfaceVariant: Color(4291218386),
      outline: Color(4288586666),
      outlineVariant: Color(4286481546),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292928488),
      inverseOnSurface: Color(4280691246),
      inversePrimary: Color(4278275186),
      primaryFixed: Color(4291487487),
      onPrimaryFixed: Color(4278194976),
      primaryFixedDim: Color(4288072952),
      onPrimaryFixedVariant: Color(4278205015),
      secondaryFixed: Color(4292077046),
      onSecondaryFixed: Color(4278326046),
      secondaryFixedDim: Color(4290234841),
      onSecondaryFixedVariant: Color(4280825925),
      tertiaryFixed: Color(4293647615),
      onTertiaryFixed: Color(4279634729),
      tertiaryFixedDim: Color(4291805416),
      onTertiaryFixedVariant: Color(4282134609),
      surfaceDim: Color(4279243799),
      surfaceBright: Color(4281743934),
      surfaceContainerLowest: Color(4278914834),
      surfaceContainerLow: Color(4279770144),
      surfaceContainer: Color(4280033316),
      surfaceContainerHigh: Color(4280691246),
      surfaceContainerHighest: Color(4281414969),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294573055),
      surfaceTint: Color(4288072952),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4288336380),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294573055),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4290563549),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294965758),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4292134124),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      background: Color(4279243799),
      onBackground: Color(4292928488),
      surface: Color(4279243799),
      onSurface: Color(4294967295),
      surfaceVariant: Color(4282468173),
      onSurfaceVariant: Color(4294573055),
      outline: Color(4291218386),
      outlineVariant: Color(4291218386),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292928488),
      inverseOnSurface: Color(4278190080),
      inversePrimary: Color(4278201669),
      primaryFixed: Color(4292078335),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4288336380),
      onPrimaryFixedVariant: Color(4278196264),
      secondaryFixed: Color(4292405754),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4290563549),
      onSecondaryFixedVariant: Color(4278655012),
      tertiaryFixed: Color(4293911295),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4292134124),
      onTertiaryFixedVariant: Color(4279963695),
      surfaceDim: Color(4279243799),
      surfaceBright: Color(4281743934),
      surfaceContainerLowest: Color(4278914834),
      surfaceContainerLow: Color(4279770144),
      surfaceContainer: Color(4280033316),
      surfaceContainerHigh: Color(4280691246),
      surfaceContainerHighest: Color(4281414969),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary, 
    required this.surfaceTint, 
    required this.onPrimary, 
    required this.primaryContainer, 
    required this.onPrimaryContainer, 
    required this.secondary, 
    required this.onSecondary, 
    required this.secondaryContainer, 
    required this.onSecondaryContainer, 
    required this.tertiary, 
    required this.onTertiary, 
    required this.tertiaryContainer, 
    required this.onTertiaryContainer, 
    required this.error, 
    required this.onError, 
    required this.errorContainer, 
    required this.onErrorContainer, 
    required this.background, 
    required this.onBackground, 
    required this.surface, 
    required this.onSurface, 
    required this.surfaceVariant, 
    required this.onSurfaceVariant, 
    required this.outline, 
    required this.outlineVariant, 
    required this.shadow, 
    required this.scrim, 
    required this.inverseSurface, 
    required this.inverseOnSurface, 
    required this.inversePrimary, 
    required this.primaryFixed, 
    required this.onPrimaryFixed, 
    required this.primaryFixedDim, 
    required this.onPrimaryFixedVariant, 
    required this.secondaryFixed, 
    required this.onSecondaryFixed, 
    required this.secondaryFixedDim, 
    required this.onSecondaryFixedVariant, 
    required this.tertiaryFixed, 
    required this.onTertiaryFixed, 
    required this.tertiaryFixedDim, 
    required this.onTertiaryFixedVariant, 
    required this.surfaceDim, 
    required this.surfaceBright, 
    required this.surfaceContainerLowest, 
    required this.surfaceContainerLow, 
    required this.surfaceContainer, 
    required this.surfaceContainerHigh, 
    required this.surfaceContainerHighest, 
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
