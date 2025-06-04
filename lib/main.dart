import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:movefy/screens/cadastro_screen.dart';
import 'package:movefy/screens/createPassword_screen.dart';
import 'package:movefy/screens/profilePage_screen.dart';
import 'package:movefy/screens/home_screen.dart'; // Arquivo combinado
import 'package:movefy/screens/login_screen.dart';
import 'package:movefy/screens/searchActivities_screen.dart';
import 'package:movefy/screens/createPost_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MoveFy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF4285F4),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF4285F4),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black87),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/cadastro': (context) => SignupScreen(),
        '/home': (context) => FeedHomeScreen(), // Tela combinada
        '/createpassword': (context) => NewPasswordScreen(),
        '/post': (context) => PostScreen(),
        '/profile': (context) => ProfileScreen(),
        '/activities': (context) => ActivitySearchScreen(),
      },
    );
  }
}