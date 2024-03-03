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
  late Stopwatch stopWatch;
  late Timer timer;

  int minisec = 0, second = 0, minute = 0, hour = 0;
  String digitMinisec = "00",
      digitSecond = "00",
      digitMinutes = "00",
      digitHour = "00";

  bool started = false;
  List<String> laps = [];

  int selectedColumnIndex = -1;
  int selectedIconIndex = -1;
  Color iconColor = Color(0xFF454545);
  Color textColor = Color(0xFF454545);

  @override
  void initState() {
    super.initState();
    stopWatch = Stopwatch();
    timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {
        var elapsedMilliseconds = stopWatch.elapsedMilliseconds;

        hour = (elapsedMilliseconds ~/ 3600000);
        minute = ((elapsedMilliseconds ~/ 60000) % 60);
        second = ((elapsedMilliseconds ~/ 1000) % 60);
        minisec = (elapsedMilliseconds % 1000);

        digitHour = hour.toString().padLeft(2, '0');
        digitMinutes = minute.toString().padLeft(2, '0');
        digitSecond = second.toString().padLeft(2, '0');
        digitMinisec = (minisec ~/ 10).toString().padLeft(2, '0');
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }


  void addLaps() {
    String lap = "$digitHour:$digitMinutes:$digitSecond:$digitMinisec";
    setState(() {
      laps.add(lap);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor:  Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Stopwatch',
            style: TextStyle(color: Colors.teal, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          elevation: 10,
          shadowColor: Colors.black,
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child:Container(
                  alignment: Alignment.center,
                  // margin: EdgeInsets.all(10)
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '$digitHour',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.w600),
                          ),
                          const Text(
                            ':',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            digitMinutes,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.w600),
                          ),
                          const Text(
                            ':',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '$digitSecond',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.w600),
                          ),
                          const Text(
                            '.',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '$digitMinisec',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),






              ),
            ),
            Container(
              height: 350,
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
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          "${laps[index]}",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 80),
            Row(children: [
              InkWell(
                onTap: () {
                  (!stopWatch.isRunning) ? stopWatch.start() : stopWatch.stop();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 45,
                  width: 170,
                  decoration: BoxDecoration(
                      border:
                      Border.all(color: Colors.blueAccent, width: 2),
                      borderRadius:
                      BorderRadius.all(Radius.circular(50))),
                  child: Text(
                    (!stopWatch.isRunning) ? "Start" : "Stop",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  addLaps();
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    border: Border.all(color: Colors.blue, width: 1.5),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                      onPressed: () {
                        addLaps();
                      },
                      icon: const Icon(Icons.flag)),
                ),
              ),
              InkWell(
                onTap: () {
                  laps.clear();
                  stopWatch.reset();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 45,
                  width: 170,
                  decoration: BoxDecoration(
                      border:
                      Border.all(color: Colors.blueAccent, width: 2),
                      borderRadius:
                      BorderRadius.all(Radius.circular(50))),
                  child: const Text(
                    'Restart',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                ),
              )
            ]),

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
                  buildIconColumn(0, Icons.alarm, 'Alarm'),
                  buildIconColumn(1, Icons.language, 'World Clock'),
                  buildIconColumn(2, Icons.timer_outlined, 'Stopwatch'),
                  buildIconColumn(3, Icons.hourglass_empty, 'Timer'),
                ],
              ),
            )
          ],
        ),
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
                Navigator.of(context).pushReplacementNamed('/');
                break;
              case 1:
                Navigator.of(context).pushReplacementNamed('/second');
                break;
              case 2:
                Navigator.of(context).pushReplacementNamed('/third');
                break;
              case 3:
                Navigator.of(context).pushReplacementNamed('/four');
                break;
            }
          },
          child: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              // color: (selectedColumnIndex == index)
              //     ? Colors.teal // Change the color for the selected screen
              //     : Colors.transparent,
              shape: BoxShape.circle,
            ),
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