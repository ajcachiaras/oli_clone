import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:noli/models/goals_model.dart';
import 'package:noli/pages/home_page.dart';
import 'package:noli/providers/user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  GetIt getIt = GetIt.instance;

  // need to figure out what to register with getit here
  // some more learning about dependency injection
  // getIt.registerSingleton(instance)

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => GoalsModel())
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
