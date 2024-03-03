import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const Analog());
}

class Analog extends StatefulWidget {
  const Analog({super.key});

  @override
  State<Analog> createState() => _AnalogState();
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

class _AnalogState extends State<Analog> {


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
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actionsIconTheme: IconThemeData(color: Colors.white),
        actions: [Icon(Icons.more_vert)],
        backgroundColor: Colors.black,
        title: const Text(
          'Clock',
          style: TextStyle(
              color: Colors.teal, fontSize: 25, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
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
                      (index) => Transform.rotate(
                        angle: index * 6 * pi / 180,
                        child: VerticalDivider(
                          color: (index % 5 == 0) ? Colors.white : Colors.grey,
                          thickness: 1,
                          indent: (index % 5 == 0) ? 288 : 288,
                          endIndent: (index % 5 == 0) ? 1 : 10,
                        ),
                      ),
                    ),
                    const Positioned.fill(
                      child: Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 8,
                        ),
                      ),
                    ),

                    // hour rotation

                    Transform.rotate(
                      angle: (hour + dateTime.minute / 60) * 30 * pi / 180,
                      child: const VerticalDivider(
                        color: Colors.white,
                        thickness: 5,
                        indent: 60,
                        endIndent: 130,
                      ),
                    ),

                    // minute rotation

                    Transform.rotate(
                      angle: dateTime.minute * 6 * pi / 180,
                      child: const VerticalDivider(
                        color: Colors.white,
                        thickness: 4,
                        indent: 45,
                        endIndent: 130,
                      ),
                    ),

                    // seconds rotations

                    Transform.rotate(
                      angle: dateTime.second * 6 * pi / 180,
                      child: const VerticalDivider(
                        color: Colors.teal,
                        thickness: 6,
                        indent: 25,
                        endIndent: 270,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'India Standard Time |',
                    style: TextStyle(
                        color: Color(0xFF616264),
                        fontSize: 19,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    DateFormat(' EEE').format(dateTime),
                    style: TextStyle(
                        color: Color(0xFF616264),
                        fontSize: 19,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    DateFormat(' , ${dateTime.day} '
                            '')
                        .format(dateTime),
                    style: TextStyle(
                        color: Color(0xFF616264),
                        fontSize: 19,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    DateFormat('MMM').format(dateTime),
                    style: TextStyle(
                        color: Color(0xFF616264),
                        fontSize: 19,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 15),
                height: 120,
                width: 420,
                decoration: const BoxDecoration(
                    color: Color(0xFF1F1F1F),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: ListView(
                  children: [
                    ListTile(
                      title: Text(
                        'Gujarat',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        'Today',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      trailing: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text:
                                  "$hour : ${(dateTime.minute <= 9) ? '0${dateTime.minute}' : '${dateTime.minute}'}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w600)),
                          TextSpan(
                              text: " ${dateTime.hour < 12 ? 'AM' : 'PM'}",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 23,
                                  fontWeight: FontWeight.w600))
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              ),

              // adding icon of plus.

              Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Color(0xFF00BFC1), shape: BoxShape.circle),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 40,
                  )),

              const SizedBox(
                height: 30,
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
                            (click == 0)
                                ? Navigator.of(context).pushNamed('/')
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
                                        borderRadius:
                                            BorderRadius.circular(50)),
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
      ),
    );
  }
}
