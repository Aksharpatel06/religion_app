import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:religion_app/view/provider/theme_provider.dart';
import 'package:religion_app/view/screen/home/home_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
    ),
  ],child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).isThemeDark
          ? ThemeData.dark()
          : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
