// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:social_network_app/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SocialNetwork',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        secondaryHeaderColor: Colors.teal
      ),
      home: Home(),
    );
  } 
}
