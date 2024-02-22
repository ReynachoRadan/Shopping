import 'package:flutter/material.dart';
import 'package:navigasi/Pages/home_page.dart';
import 'package:navigasi/Pages/item_page.dart';
import 'package:navigasi/Pages/list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopee',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/item': (context) => ItemPage(),
        '/list': (context) => ListPage(
              items: [],
            ),
      },
    );
  }
}
