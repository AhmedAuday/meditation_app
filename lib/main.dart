import 'package:ahmed_meditation_app/Screens/player_screen.dart';
import 'package:ahmed_meditation_app/Screens/meditation_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meditation App',
      routes: {
        MeditationScreen.id: (context) => const MeditationScreen(),
        PlayerScreen.id: (context) => const PlayerScreen(),
      },
      initialRoute: MeditationScreen.id,
    );
  }
}
