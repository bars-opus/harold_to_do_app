import 'package:flutter/scheduler.dart';
import 'utility/exports.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with WidgetsBindingObserver {
  //  light theme
  final ThemeData _lightTheme = ThemeData(
    primaryColorLight: Colors.white,
    textTheme: const TextTheme(
      displayMedium: TextStyle(
          fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(
        fontSize: 14.0,
        color: Colors.black,
      ),
    ),
  );

  // dark theme
  final ThemeData _darkTheme = ThemeData(
    primaryColorLight: const Color(0xFF343434),
    textTheme: const TextTheme(
      displayMedium: TextStyle(
          fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(
        fontSize: 14.0,
        color: Colors.white,
      ),
    ),
  );

  ThemeData _currentTheme = ThemeData();

  // Update the current theme based on the platform brightness
  @override
  void didChangePlatformBrightness() {
    setState(() {
      _currentTheme =
          SchedulerBinding.instance.window.platformBrightness == Brightness.dark
              ? _darkTheme
              : _lightTheme;
    });
  }

  // Set the initial theme based on the platform brightness
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _currentTheme =
        WidgetsBinding.instance.window.platformBrightness == Brightness.dark
            ? _darkTheme
            : _lightTheme;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _currentTheme,
      home: BlocProvider<TodoBloc>(
        create: (context) => TodoBloc()..add(const TodoEvent()),
        child: const TodoScreen(),
      ),
    );
  }
}
