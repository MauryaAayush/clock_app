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

  @override
  void initState() {
    super.initState();
    stopWatch = Stopwatch();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void start() {
    stopWatch.start();
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

  void stop() {
    timer.cancel();
    setState(() {
      started = false;
    });
  }

  void restart() {
    timer.cancel();
    stopWatch.reset();
    setState(() {
      hour = minute = second = minisec = 0;
      digitHour = digitMinutes = digitSecond = digitMinisec = "00";
      started = false;
      laps.clear();
    });
  }

  void addLaps() {
    String lap = "$digitHour:$digitMinutes:$digitSecond:$digitMinisec";
    setState(() {
      laps.add(lap);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151C2F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF151C2F),
        title: const Text(
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
                (!started) ? start() : stop();
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
                  (!started) ? "Start" : "Stop",
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
                restart();
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
          ])
        ],
      ),
    );
  }
}
