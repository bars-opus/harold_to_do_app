
import 'package:flutter/scheduler.dart';
import 'utility/exports.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with WidgetsBindingObserver {
  ThemeData _currentTheme = ThemeData();

  // Update the current theme based on the platform brightness
  @override
  void didChangePlatformBrightness() {
    setState(() {
      _currentTheme =
          SchedulerBinding.instance.window.platformBrightness == Brightness.dark
              ? AppTheme.darkTheme
              : AppTheme.lightTheme;
    });
  }

// Set the initial theme based on the platform brightness
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _currentTheme =
        WidgetsBinding.instance.window.platformBrightness == Brightness.dark
            ? AppTheme.darkTheme
            : AppTheme.lightTheme;
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
      home: const TaskScreen(),
    );
  }
}
