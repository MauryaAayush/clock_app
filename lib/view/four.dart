import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'first.dart';

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


int second = 60;
int count = 1;

class _TimerappState extends State<Timerapp> {

  bool isTimerRunning = false;

  timerFunction() async {
    await Future.delayed(
      Duration(seconds: 1),
          () {
        if (isTimerRunning && second > 0) {
          second--;
          setState(() {});
          timerFunction();
        }
      },
    );
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
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(70),
                  height: 300,
                  width: 300,
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
                              thickness: 2,
                              indent:  285,
                              endIndent:  10,
                            ),
                          ),
                        ),
                      ),

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

                      Center(
                        child: SizedBox(
                          height: 275,
                          width: 275,
                          child: CircularProgressIndicator(
                            color: Colors.teal,
                            strokeWidth: 6,
                            value: second / 60,
                          ),
                        ),
                      )

                    ],
                  ),
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: () {
              setState(() {
                second *= count;
              });
              timerFunction();
            },
            child: Container(
              alignment: Alignment.center,
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.teal, borderRadius: BorderRadius.circular(10)),
              child: Text(
                '$count minutes',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ),

          SizedBox(height: 80,),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              GestureDetector(
                onTap: () {
                  setState(() {
                    second = 60;
                  });
                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Color(0xFF262626),
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Icon(Icons.replay,size: 30,color: Colors.white,),
                ),
              ),

              SizedBox(width: 20,),

              GestureDetector(
                onTap: () {
                  setState(() {
                    isTimerRunning = !isTimerRunning;
                    if (isTimerRunning) {
                      timerFunction();
                    }
                  });
                },
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    isTimerRunning ? Icons.pause : Icons.play_arrow,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),

              SizedBox(width: 20,),

              GestureDetector(
                onTap: () {
                  setState(() {
                    count++;
                  });
                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Color(0xFF262626),
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Icon(Icons.add,size: 30,color: Colors.white,),
                ),
              ),

            ],
          ),

          SizedBox(height: 30,),

          // this is bottom nav bar

          Container(
            padding: EdgeInsets.all(0),
            alignment: Alignment.center,
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color(0xFF141414),
                border: Border(
                  top: BorderSide(
                    color: Colors.white12
                  )
                )
            ),
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
                        (click == 2)
                            ? Navigator.of(context).pushReplacementNamed('/third')
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
