// import 'dart:async';
// import 'dart:math';
//
// import 'package:analog_clock/analog_clock.dart';
// import 'package:digital_clock/colors/digital_clock.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
//
// class TimerApp extends StatefulWidget {
//   const TimerApp({super.key});
//
//   @override
//   State<TimerApp> createState() => _TimerAppState();
// }
//
// late double height, width;
//
// class _TimerAppState extends State<TimerApp> {
//   int minutes = 1;
//   late int second = (minutes * 60);
//   bool isRunning = false;
//
//   void startStop() async {
//     setState(() {});
//
//     await Future.delayed(const Duration(seconds: 1), () {
//       setState(() {
//         second--;
//       });
//     });
//
//     if (isRunning) {
//       if (second > 0) {
//         startStop();
//       } else {
//         isRunning = false;
//         setState(() {
//           second = minutes * 60;
//         });
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     height = MediaQuery.of(context).size.height;
//     width = MediaQuery.of(context).size.width;
//
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.black,
//         appBar: AppBar(
//           centerTitle: true,
//           iconTheme: IconThemeData(color: timeColor),
//           backgroundColor: Colors.transparent,
//           title: Text(
//             'Timer',
//             style: TextStyle(
//               color: timeColor,
//               fontSize: 26,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//         body: Center(
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   // hours and minutes
//                   analog(),
//
//                   //other stuffs
//                   rightStuffs(),
//                 ])),
//       ),
//     );
//   }
//
//   analog() {
//     return Container(
//       height: 300,
//       width: 300,
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         border: Border.all(color: timeColor, width: 5),
//       ),
//       child: Stack(
//         children: [
//           //analog clock text/ numbers
//           AnalogClock(
//             tickColor: Colors.transparent,
//             numberColor: timeColor,
//             showAllNumbers: true,
//             showSecondHand: false,
//             showDigitalClock: false,
//             showTicks: true,
//             hourHandColor: Colors.transparent,
//             minuteHandColor: Colors.transparent,
//           ),
//           ...List.generate(
//             60,
//                 (index) => Center(
//               child: Transform.rotate(
//                 angle: index * 6 * pi / 180,
//                 child: VerticalDivider(
//                   color: (index % 5 == 0) ? timeColor : Colors.white,
//                   thickness: (index % 5 == 0) ? 4 : 1,
//                   indent: (index % 5 == 0) ? height / 1.11 : height / 1.11,
//                 ),
//               ),
//             ),
//           ),
//
//           //circular progress bar
//           Center(
//             child: SizedBox(
//               height: 300,
//               width: 300,
//               child: CircularProgressIndicator(
//                 value: second / (60 * minutes),
//                 color: timeColor,
//                 strokeWidth: 10,
//               ),
//             ),
//           ),
//
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('$minutes min Timer',
//                     style: GoogleFonts.varelaRound(
//                       textStyle: TextStyle(
//                           color: Colors.red.shade100,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold),
//                     )),
//
//                 //start button
//                 CupertinoButton(
//                   onPressed: () {
//                     if (isRunning) {
//                       isRunning = false;
//                     } else {
//                       isRunning = true;
//                       startStop();
//                     }
//                   },
//                   child: Container(
//                     padding:
//                     const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                     decoration: BoxDecoration(
//                       color: timeColor,
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                     child: Text(
//                       isRunning ? 'Stop' : 'Start',
//                       style: GoogleFonts.varelaRound(
//                         textStyle: const TextStyle(
//                             color: Colors.black,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                             letterSpacing: 2),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   rightStuffs() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         addBtn(1),
//         addBtn(5),
//         addBtn(10),
//         addBtn(20),
//         addBtn(30),
//       ],
//     );
//   }
//
//   showDayDate({required String day, Color? color, double? size}) {
//     return TextSpan(
//         text: day,
//         style: GoogleFonts.varelaRound(
//             textStyle: TextStyle(
//                 fontSize: size ?? 30,
//                 color: color ?? Colors.white,
//                 fontWeight: FontWeight.w600)));
//   }
//
//   addNum(int index) {
//     return (
//     '$index',
//     style: TextStyle(color: timeColor, fontSize: height / 20),
//     );
//   }
//
//   addBtn(int min) {
//     return CupertinoButton(
//         child: Container(
//           width: 100,
//           height: 24,
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             color: timeColor,
//             borderRadius: BorderRadiusDirectional.circular(5),
//           ),
//           child: Text('$min minutes',
//               style: GoogleFonts.varelaRound(
//                 textStyle: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 12,
//                     fontWeight: FontWeight.bold),
//               )),
//         ),
//         onPressed: () {
//           setState(() {
//             minutes = min;
//             second = minutes * 60;
//           });
//         });
//   }
//
// // void checkState() {
// //   setState(() {
// //     sec++;
// //     dateTime = DateTime.now();
// //   });
// // }
// }


import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const TimerApp());
}

class TimerApp extends StatefulWidget {
  const TimerApp({Key? key}) : super(key: key);

  @override
  State<TimerApp> createState() => _TimerAppState();
}

class _TimerAppState extends State<TimerApp> {
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
                      '$minutes min Timer',
                      style: TextStyle(
                        color: Colors.teal,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  CircularProgressIndicator(
                    value: 1 - (second / (minutes * 60)),
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
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                isRunning = true;
                startStop();
              });
            },
            child: Text('Start Timer'),
          ),
          Container(
            padding: EdgeInsets.all(0),
            alignment: Alignment.center,
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFF141414),
              border: Border.symmetric(
                horizontal: BorderSide(color: Colors.white38),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [],
            ),
          )
        ],
      ),
    );
  }
}
