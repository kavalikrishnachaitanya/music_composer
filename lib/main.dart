import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:music_composer/providers/llm_provider.dart';
import 'package:music_composer/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LLMProvider()),
      ],
      child: MaterialApp(
        title: 'Music App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomeScreen(),
      ),
    );
  }
}
