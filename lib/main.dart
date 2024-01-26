import 'package:blog_app/screens/option_screen.dart';
import 'package:blog_app/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main()async{
  
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    // Replace with actual values
    options: const FirebaseOptions(
      apiKey: "AIzaSyCE7cC2iZVd50HtXZ0jbQsXNdvgOaGR6hs",
      appId: "1:493994304823:android:2ff19886692c2fbe8466b2",
      messagingSenderId: "493994304823",
      projectId: "blog-app-flutter-de67e",
      authDomain: 'blog-app-flutter-de67e.firebaseapp.com',
      databaseURL: 'https://blog-app-flutter-de67e-default-rtdb.firebaseio.com',
      storageBucket: 'blog-app-flutter-de67e.appspot.com'
    ),
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: SplashScreen(),
    );
  }
}
