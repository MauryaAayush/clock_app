import 'dart:async';

import 'package:flutter/cupertino.dart';
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

  int selectedColumnIndex = -1;
  int selectedIconIndex = -1;
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
      body: Column(
        children: [
          Expanded(

            child: Container(
              margin: EdgeInsets.all(70),
              height: 350,
              width: 350,
              decoration: BoxDecoration(
                color: Color(0xFF0A0A0A),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.teal,
                    offset: Offset(5, 10),
                    blurRadius: 10,
                    spreadRadius: 2,
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
          ),

          Container(
            alignment: Alignment.center,
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color(0xFF141414),
                border: Border.symmetric(horizontal: BorderSide(color: Colors.white38))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildIconColumn(0, Icons.alarm, 'Alarm'),
                buildIconColumn(1, Icons.language, 'World Clock'),
                buildIconColumn(2, Icons.timer_outlined, 'Stopwatch'),
                buildIconColumn(3, Icons.hourglass_empty, 'Timer'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Column buildIconColumn(int index, IconData icon, String text) {
    Color iconColor = Color(0xFF454545);
    Color textColor = Color(0xFF454545);

    if (selectedColumnIndex == index) {
      iconColor = Colors.white;
      textColor = Colors.white;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selectedColumnIndex = index;
            });

            // Set the selected index for the icons screen
            selectedIconIndex = index;

            // Navigate to the respective screen
            switch (index) {
              case 0:
                Navigator.of(context).pushNamed('/');
                break;
              case 1:
                Navigator.of(context).pushNamed('/second');
                break;
              case 2:
                Navigator.of(context).pushNamed('/third');
                break;
              case 3:
                Navigator.of(context).pushNamed('/four');
                break;
            }
          },
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              icon,
              color: iconColor,
              size: 30,
            ),
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: textColor,
          ),
        )
      ],
    );
  }
}
