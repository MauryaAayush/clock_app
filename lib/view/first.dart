import 'dart:async';
import 'dart:ui';
import 'package:intl/intl.dart';

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

class _SimpleClockState extends State<SimpleClock> {
  @override
  Widget build(BuildContext context) {
    int hour = dateTime.hour % 12;
    hour = (hour == 0) ? 12 : hour;

    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        dateTime = DateTime.now();
      });
    });

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Digital Clock',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          elevation: 10,
          shadowColor: Colors.black,
        ),
        body: Center(
          child: Stack(children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              // color: Colors.blue,
              child: Image.asset(
                'assets/images/back.jpg',
                fit: BoxFit.fitHeight,
              ),
            ),
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
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Stack(children: [
                              Positioned(
                                top: 53,
                                child: Container(
                                  color: Colors.white,
                                  height: 2,
                                  width: 80,
                                ),
                              ),
                              ClipRect(
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                                  child: Container(
                                    height: 100,
                                    width: 80,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Text(
                                      '$hour',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 50,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                            SizedBox(
                              width: 10,
                            ),
                            Stack(children: [
                              Positioned(
                                top: 53,
                                child: Container(
                                  color: Colors.white,
                                  height: 2,
                                  width: 90,
                                ),
                              ),
                              ClipRect(
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                                  child: Container(
                                    height: 100,
                                    width: 80,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Text(
                                      ' ${dateTime.minute} ',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 50),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                            SizedBox(
                              width: 10,
                            ),
                            Stack(children: [
                              Positioned(
                                top: 53,
                                child: Container(
                                  color: Colors.white,
                                  height: 2,
                                  width: 90,
                                ),
                              ),
                              ClipRect(
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                                  child: Container(
                                    height: 100,
                                    width: 80,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Text(
                                      '${dateTime.second}',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 50),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                            SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                              child: Container(
                                height: 50,
                                width: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Text(
                                  "${dateTime.hour < 12 ? 'AM' : 'PM'}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${dateTime.day}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              DateFormat('MMMM').format(dateTime),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              '${dateTime.year}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 100,
                right: 160,
                child: CircleAvatar(child: Icon(Icons.language,size: 50,
                color: Colors.white),radius: 45,
                backgroundColor: Colors.black54,))
          ]),
        ));
  }
}
