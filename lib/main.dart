import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:religion_app/view/controller/helper/api_sarvice.dart';
import 'package:religion_app/view/controller/image_provider.dart';
import 'package:religion_app/view/controller/theme_provider.dart';
import 'package:religion_app/view/screen/splash/splash_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => ApiSarvice(),
    ),
    ChangeNotifierProvider(
      create: (context) => ImagesProvider(),
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
      home: const SplashScreen(),
    );
  }
}
