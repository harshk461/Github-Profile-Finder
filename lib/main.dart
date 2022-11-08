import 'package:flutter/material.dart';
import 'package:github_profile_finder/screens/profile_find.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileFindPage(),
    );
  }
}
