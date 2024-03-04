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

List icons = [
  Icons.alarm,
  Icons.language,
  Icons.timer_outlined,
  Icons.hourglass_empty,
];
List name = [
  'Alarm',
  'Clock',
  'Stopwatch',
  'Timer',
];
int click = 0;

class _TimerappState extends State<Timerapp> {
  int minutes = 1;
  late int second = (minutes * 60);
  bool isRunning = false;
  late Timer timer;

  void startStop() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (isRunning && second > 0) {
          second--;
        } else {
          timer.cancel();
          isRunning = false;
          second = minutes * 60;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    int hour = dateTime.hour % 12;
    hour = (hour == 0) ? 12 : hour;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'Timer',
          style: TextStyle(
              color: Colors.teal, fontSize: 25, fontWeight: FontWeight.w600),
        ),
        actionsIconTheme: const IconThemeData(color: Colors.white),
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
                      '$second sec',
                      style: TextStyle(
                        color: Colors.teal,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Add other clock elements as needed

                  CircularProgressIndicator(
                    value: 1 - (minutes / 60),
                    // Assuming the timer is set for 60 seconds
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
                    strokeWidth: 5,
                  ),
                ],
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              setState(() {
                if (isRunning) {
                  isRunning = false;
                  timer.cancel();
                } else {
                  isRunning = true;
                  startStop();
                }
              });
            },
            child: Container(
              alignment: Alignment.center,
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text(
                '5 minutes',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),

          ElevatedButton(
            onPressed: () {
              setState(() {
                isRunning = true;
              });
            },
            child: Text('Start Timer'),
          ),

          // this is bottom nav bar

          Container(
            padding: EdgeInsets.all(0),
            alignment: Alignment.center,
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color(0xFF141414),
                border: Border.symmetric(
                    horizontal: BorderSide(color: Colors.white38))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...List.generate(
                  icons.length,
                  (index) => InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      setState(() {
                        click = index;
                        (click == 0)
                            ? Navigator.of(context).pushNamed('/')
                            : null;
                        (click == 1)
                            ? Navigator.of(context).pushNamed('/second')
                            : null;
                        (click == 2)
                            ? Navigator.of(context).pushNamed('/third')
                            : null;
                      });
                    },
                    child: (click == index)
                        ? Column(
                            children: [
                              Container(
                                  height: 50,
                                  width: 120,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Icon(
                                    icons[index],
                                    color: Colors.white,
                                    size: 30,
                                  )),
                              Text(
                                '${name[index]}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              Container(
                                height: 50,
                                width: 90,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50)),
                                child: Icon(
                                  icons[index],
                                  color: Colors.grey,
                                  size: 30,
                                ),
                              ),
                              Text(
                                '${name[index]}',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
