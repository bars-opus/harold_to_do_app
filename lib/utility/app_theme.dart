import 'package:harold_to_do_app/utility/exports.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    primaryColorLight: Colors.white,
    canvasColor: Colors.green,
    secondaryHeaderColor: Colors.white,
    textTheme: TextTheme(
      displayLarge: _AppTextTheme.light.displayLarge,
      displayMedium: _AppTextTheme.light.displayMedium,
      displaySmall: _AppTextTheme.light.displaySmall,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
    canvasColor: Colors.green,
    primaryColorLight: Colors.black,
    secondaryHeaderColor: Colors.black,
    textTheme: TextTheme(
      displayLarge: _AppTextTheme.dark.displayLarge,
      displayMedium: _AppTextTheme.dark.displayMedium,
      displaySmall: _AppTextTheme.dark.displaySmall,
    ),
  );
}

class _AppTextTheme {
  static final _AppTextTheme light = _AppTextTheme._(color: Colors.black);
  static final _AppTextTheme dark = _AppTextTheme._(color: Colors.white);

  final TextStyle displayLarge;
  final TextStyle displayMedium;
  final TextStyle displaySmall;

  _AppTextTheme._({required Color color})
      : displayLarge = TextStyle(
            fontSize: 2.5 * SizeConfig.textMultiplier,
            color: color,
            fontWeight: FontWeight.bold),
        displayMedium =
            TextStyle(fontSize: 2 * SizeConfig.textMultiplier, color: color),
        displaySmall = TextStyle(
          fontSize: 1.7 * SizeConfig.textMultiplier,
          color: color,
        );
}
