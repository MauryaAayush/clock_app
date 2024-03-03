import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const SimpleClock());
}

class SimpleClock extends StatefulWidget {
  const SimpleClock({super.key});

  @override
  State<SimpleClock> createState() => _SimpleClockState();
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

class _SimpleClockState extends State<SimpleClock> {
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
        title: Text(
          'Alarm',
          style: TextStyle(
            color: Colors.teal,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actionsIconTheme: IconThemeData(color: Colors.white),
        actions: [
          Icon(Icons.more_vert),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 350,
            ),
            Icon(
              Icons.warning,
              color: Colors.amber,
              size: 50,
            ),
            Expanded(
              child: Text(
                'Under Processing',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
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
                          (click == 1)
                              ? Navigator.of(context).pushNamed('/second')
                              : null;
                          (click == 2)
                              ? Navigator.of(context).pushNamed('/third')
                              : null;
                          (click == 3)
                              ? Navigator.of(context).pushNamed('/four')
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
                                        borderRadius:
                                            BorderRadius.circular(50)),
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
