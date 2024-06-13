import 'package:flutter/material.dart';
import 'package:shopping_list_app/Consts/strings.dart';
import 'package:shopping_list_app/HomePage/my_home_page.dart';
import 'Consts/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: appName,
      theme: ThemeData(
        primaryColor: primary,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: secondary,
        ),

      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Accueil'),
    );
  }
}


