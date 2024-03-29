import 'package:clock_app/view/Stop.dart';
import 'package:clock_app/view/first.dart';
import 'package:clock_app/view/four.dart';
import 'package:clock_app/view/re_third.dart';
import 'package:clock_app/view/second.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clock',
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => const SimpleClock(),
        '/second' : (context) => const Analog(),
        '/third' : (context) => const StopW(),
        '/four' : (context) => const Timerapp(),
        '/timer' : (context) => const TimerAppScreen(),
      },


    );
  }
}
