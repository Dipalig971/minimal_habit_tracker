import 'package:flutter/material.dart';
import 'package:minimal_habit_tracker/pages/home_page.dart';
import 'package:minimal_habit_tracker/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ThemeProvider(),)
  ],
  builder:(context, child) =>  const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: Provider.of<ThemeProvider>(context).ThemeMode,
    );
  }
}
