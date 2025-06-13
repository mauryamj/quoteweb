import 'package:flutter/material.dart';
import 'quote_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quote Display',
      home: QuoteScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}
