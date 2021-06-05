import 'package:news_app/pages/article.dart';
import 'package:news_app/pages/bookmark.dart';
import 'package:news_app/pages/homepage.dart';
import 'package:news_app/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomePage(),
        '/article': (context) => ArticlePage(),
        '/bookmark': (context) => Bookmark(),
      },
      theme: ThemeData(fontFamily: 'SFProText'),
    );
  }
}
