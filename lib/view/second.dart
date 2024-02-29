import 'dart:async';
import 'dart:math';
import 'dart:ui';
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
        backgroundColor: Colors.black,
        title: const Text(
          'Analog Clock',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/back.jpg',),fit: BoxFit.fill),

        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 230,
                  width: 230,
                  decoration: BoxDecoration(
                      color: Colors.black38,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.green,
                        width: 2,
                      )),
                  child: Stack(
                    children: [

                      // Container(
                      //   height: 100,
                      //   width: 100,
                      //   decoration: BoxDecoration(
                      //     shape: BoxShape.circle,
                      //     border: Border.all(
                      //         color: Colors.red,
                      //         width: 2)
                      //   ),
                      // ),

                      ...List.generate(
                        60,
                        (index) => Transform.rotate(
                          angle: index * 6 * pi / 180,
                           child: //Text('${index++}',style: TextStyle(
                          //   color: (index % 5 == 0) ? Colors.green : Colors.blue,
                          // ),),

                          VerticalDivider(
                            color: (index % 5 == 0) ? Colors.transparent : Colors.transparent,
                            thickness: 2,
                            indent: (index % 5 == 0) ? 208 : 215,
                            endIndent: 0,
                          ),
                        ),
                      ),
                      const Positioned.fill(
                        child: Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 10,
                          ),
                        ),
                      ),
                      Transform.rotate(
                        angle: (hour + dateTime.minute / 60) * 30 * pi / 180,
                        child: const VerticalDivider(
                          color: Colors.green,
                          thickness: 3.5,
                          indent: 40,
                          endIndent: 95,
                        ),
                      ),
                      Transform.rotate(
                        angle: dateTime.minute * 6 * pi / 180,
                        child: const VerticalDivider(
                          color: Colors.lightGreen,
                          thickness: 3,
                          indent: 30,
                          endIndent: 95,
                        ),
                      ),
                      Transform.rotate(
                        angle: dateTime.second * 6 * pi / 180,
                        child: const VerticalDivider(
                          color: Colors.lightGreenAccent,
                          thickness: 2.5,
                          indent: 20,
                          endIndent: 85,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 150,
                ),

                ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      alignment: Alignment.center,
                      height: 170,
                      width: 370,
                      decoration: const BoxDecoration(
                          color: Colors.black12,
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
                                      decoration: const BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                      ),
                                      child: Text(
                                        '$hour',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 50,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                              const SizedBox(
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
                                      decoration: const BoxDecoration(
                                          color: Colors.black12,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Text(
                                        ' ${dateTime.minute} ',
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 50),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                              const SizedBox(
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
                                      decoration: const BoxDecoration(
                                          color: Colors.black12,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Text(
                                        '${dateTime.second}',
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 50),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                              const SizedBox(
                                width: 10,
                              ),

                            ],
                          ),
                          const SizedBox(
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

              ],
            ),
          ),
        ),
      ),
    );
  }
}
