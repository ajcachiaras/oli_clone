import 'package:flutter/material.dart';
import 'package:noli/pages/home_page.dart';
import 'package:noli/providers/user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider()
        ),
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}