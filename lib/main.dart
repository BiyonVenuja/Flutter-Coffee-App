import 'package:coffe_app/models/util.dart';
import 'package:coffe_app/pages/home.dart';
import 'package:coffe_app/pages/product_page.dart';
import 'package:coffe_app/pages/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.dark().copyWith(secondary: accentColor),
      ),
      home: Splash(),
    );
  }
}
