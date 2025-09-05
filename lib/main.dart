import 'package:flutter/material.dart';
import 'package:meme_app_flutter/presentation/pages/home.dart';
import 'package:meme_app_flutter/presentation/providers/api_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ApiProvider())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(colorScheme: ColorScheme.dark()),

      routes: {'/': (context) => Home()},
    );
  }
}
