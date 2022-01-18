import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rider_app/constants/constants.dart';
import 'package:rider_app/screens/login_screen.dart';
import 'package:rider_app/screens/main_screen.dart';
import 'package:rider_app/screens/registration_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

DatabaseReference userRef = FirebaseDatabase.instance.ref().child('users');

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taxi Rider App',
      theme: ThemeData(
        fontFamily: 'Brand Bold',
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: loginScreenRoute,
      routes: {
        homeRoute: (context) => MainScreen(),
        loginScreenRoute: (context) => MainScreen(),
        registerScreenRoute: (context) => RegistrationScreen(),
      },
    );
  }
}
