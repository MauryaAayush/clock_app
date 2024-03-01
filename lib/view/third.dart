import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const StopWatch());
}

class StopWatch extends StatefulWidget {
  const StopWatch({Key? key}) : super(key: key);

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  int minisec = 0, second = 0, minute = 0, hour = 0;
  String Digitminisec = "00",
      Digitsecond = "00",
      Digitminutes = "00",
      Digithour = "00";

  Timer? timer;
  bool started = false;
  List laps = [];

  // here we are creating function for timer

  void stop() {
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

  //here creating function for the reset

  void restart() {
    timer!.cancel();
    setState(() {
      minisec = 0;
      second = 0;
      minute = 0;
      hour = 0;

      Digitminisec = "00";
      Digitsecond = "00";
      Digitminutes = "00";
      Digithour = "00";

      started = false;
    });
  }

  void addlaps() {
    String lap = "$Digithour:$Digitminutes:$Digitsecond:$Digitminisec";

    setState(() {
      laps.add(lap);
    });
  }

  // now let's create the start function

  void start() {
    started = true;
    timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        minisec++;

        if (minisec >= 100) {
          minisec = 0;
          second++;

          if (second >= 60) {
            second = 0;
            minute++;

            if (minute >= 60) {
              minute = 0;
              hour++;
            }
          }
        }

        Digitminisec = (minisec % 100).toString().padLeft(2, '0');
        Digitsecond = second.toString().padLeft(2, '0');
        Digitminutes = minute.toString().padLeft(2, '0');
        Digithour = hour.toString().padLeft(2, '0');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF151C2F),
        appBar: AppBar(
          backgroundColor: Color(0xFF151C2F),
          title: Text(
            'Stopwatch',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          elevation: 10,
          shadowColor: Colors.black,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '$Digithour',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    ':',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '$Digitminutes',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    ':',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '$Digitsecond',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '.',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '$Digitminisec',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Container(
              height: 400,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20)),
              child: ListView.builder(
                itemCount: laps.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Lap : ${index + 1}",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          "${laps[index]}",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 80),
            Row(children: [
              InkWell(
                onTap: () {
                  (!started) ? start() : stop();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 45,
                  width: 170,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: Text(
                    (!started) ? "Start" : "Stop",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  addlaps();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    border: Border.all(color: Colors.blue, width: 1.5),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                      onPressed: () {
                        addlaps();
                      },
                      icon: Icon(Icons.flag)),
                ),
              ),
              InkWell(
                onTap: () {
                  restart();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 45,
                  width: 170,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: Text(
                    'Restart',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                ),
              )
            ])
          ],
        ));
  }
}
