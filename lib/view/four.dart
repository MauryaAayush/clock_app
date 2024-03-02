import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const Timerapp());
}

class Timerapp extends StatefulWidget {
  const Timerapp({Key? key}) : super(key: key);

  @override
  State<Timerapp> createState() => _TimerappState();


}

DateTime dateTime = DateTime.now();

class _TimerappState extends State<Timerapp> {
  @override
  Widget build(BuildContext context) {

    int hour = dateTime.hour % 12;
    hour = (hour == 0) ? 12 : hour;

    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        dateTime = DateTime.now();
      });
    });


    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Timer',
          style: TextStyle(
              color: Colors.teal, fontSize: 25, fontWeight: FontWeight.w600),
        ),
        actionsIconTheme: IconThemeData(color: Colors.white),
        actions: [Icon(Icons.more_vert)],
      ),
      body: Container(
        margin: EdgeInsets.all(70),
        height: 350,
        width: 350,
        decoration: BoxDecoration(
          color: Color(0xFF0A0A0A),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.teal,
              offset: Offset(5, 8),
              blurRadius: 20,
              spreadRadius: 5,
            ),
            BoxShadow(
              color: Color(0xFF1A1C1D),
              offset: Offset(-4, -5),
              blurRadius: 15,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Stack(
          children: [
            Center(
              child: Text(
                '${dateTime.second}',
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Add other clock elements as needed
          ],
        ),
      ),
    );
  }
}
