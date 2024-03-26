import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

import 'first.dart';

class StopW extends StatefulWidget {
  const StopW({super.key});

  @override
  State<StopW> createState() => _StopWState();
}

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


class _StopWState extends State<StopW> {
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
    String lap = "$digitMinutes:$digitSecond.$digitMinisec";
    setState(() {
      laps.add(lap);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Stopwatch',
          style: TextStyle(color: Colors.teal, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Container(
                alignment: Alignment.center,

                height: 330,
                width: 330,
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

                    ...List.generate(
                      60,
                          (index) => Center(
                        child: Transform.rotate(
                          angle: index * 6 * pi / 180,
                          child: VerticalDivider(
                            color: Colors.white,
                            thickness: 1.5,
                            indent: 325,
                            endIndent: 10,
                          ),
                        ),
                      ),
                    ),

                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
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
                  ],
                ),
              ),
            ),
          ),


          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: 300,
            width: 400,
            decoration: BoxDecoration(
                color: Colors.transparent,
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
                        style:
                            const TextStyle(color: Colors.teal
                                , fontSize: 20),
                      ),
                      Text(
                        "${laps[index]}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                GestureDetector(
                  onTap: () {
                    laps.clear();
                    stopWatch.reset();
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Color(0xFF262626),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: Icon(
                        Icons.restart_alt_outlined,
                        color: Colors.white,
                      )),
                ),



                GestureDetector(
                  onTap: () {
                    (!stopWatch.isRunning) ? stopWatch.start() : stopWatch.stop();
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                          color: Color(0xFF00BFC0),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: Icon(
                        (!stopWatch.isRunning) ? Icons.play_arrow : Icons.pause,
                        color: Colors.white,
                        size: 30,
                      )),
                ),



                GestureDetector(
                  onTap: () {
                    addLaps();
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.center,
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Color(0xFF262626),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                        onPressed: () {
                          addLaps();
                        },
                        icon: const Icon(Icons.flag,color: Colors.white,)),
                  ),
                ),

          ]),

          SizedBox(height: 30,),

          Container(
            alignment: Alignment.center,
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color(0xFF141414),
                border: Border(
                  top: BorderSide(
                    color: Colors.white12
                  )
                )),
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
                            ? Navigator.of(context).pushReplacementNamed('/')
                            : null;
                        (click == 1)
                            ? Navigator.of(context).pushReplacementNamed('/second')
                            : null;
                        (click == 3)
                            ? Navigator.of(context).pushReplacementNamed('/four')
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
