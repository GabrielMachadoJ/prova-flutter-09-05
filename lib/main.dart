import 'package:flutter/material.dart';
import 'package:prova/pages/bitcoin.dart';
import 'package:prova/pages/currencies.dart';
import 'package:prova/pages/stocks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/currencies',
      routes: {
        '/currencies': (context) => const Currencies(),
        '/stocks': (context) => const Stocks(),
        '/bitcoin': (context) => const Bitcoin(),
      },
    );
  }
}
