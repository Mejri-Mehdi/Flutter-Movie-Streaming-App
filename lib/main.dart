import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/splash_screen.dart';  // Ensure this path is correct
import 'screens/login_screen.dart';  // Ensure this path is correct

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  // Ensures proper initialization
  await Firebase.initializeApp();  // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authentication App',
      theme: ThemeData(
        primarySwatch: Colors.red,  // Main theme color
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.red),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.red,  // Red button color
        ),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
      ),
      home: SplashScreen(),  // Show Splash Screen first
    );
  }
}
