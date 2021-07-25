import 'package:flutter/material.dart';
import 'package:flutter_design_copy_2/screen/welcome/welcome_screen.dart';
import 'package:flutter_design_copy_2/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      themeMode: ThemeMode.light,
      home: WelcomeScreen(),
    );
  }
}
