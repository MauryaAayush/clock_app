import 'dart:async';
import 'dart:ui';

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
  Stopwatch stopwatch = Stopwatch();
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 30), _updateElapsedTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Stopwatch',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 10,
        shadowColor: Colors.black,
      ),
      body: Center(
        child: Stack(
          children: [
            Positioned(
              top: 90,
              left: 20,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    alignment: Alignment.center,
                    height: 170,
                    width: 370,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          width: 240,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Text(
                            formatTime(stopwatch.elapsed),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (stopwatch.isRunning) {
                                stopwatch.stop();
                              } else {
                                stopwatch.start();
                              }
                            });
                          },
                          child: Text(stopwatch.isRunning ? 'Stop' : 'Start'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _updateElapsedTime(Timer timer) {
    if (stopwatch.isRunning) {
      setState(() {});
    }
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String minutes = twoDigits(duration.inMinutes);
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    String milliseconds = twoDigits((duration.inMilliseconds % 1000) ~/ 10);
    return '$minutes:$seconds.$milliseconds';
  }
}
