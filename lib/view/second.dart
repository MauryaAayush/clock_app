import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

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
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Analog Clock',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 230,
                width: 230,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.green,
                  width: 2,
                )
                ),
                child: Stack(
                  children: [
                    ...List.generate(
                      60,
                      (index) => Transform.rotate(

                        angle: index * 6 * pi / 180,
                        child: VerticalDivider(
                          color:  (index % 5 == 0) ? Colors.green : Colors.black,
                          thickness: 2.5,
                          indent: (index % 5 == 0) ? 210 : 220,
                          endIndent: 0,
                        ),
                      ),
                    ),
                    const Positioned.fill(
                      child: Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 10,
                        ),
                      ),
                    ),


                    Transform.rotate(
                      angle:(dateTime.hour % 12 + dateTime.minute / 60) * 30 * pi / 180,
                      child: const VerticalDivider(
                        color: Colors.red,
                        thickness: 3.5,
                        indent: 40,
                        endIndent: 110,
                      ),
                    ),


                    Transform.rotate(
                      angle: dateTime.minute * 6 * pi / 180,
                      child: const VerticalDivider(
                        color: Colors.blue,
                        thickness: 3,
                        indent: 30,
                        endIndent: 110,
                      ),
                    ),



                    Transform.rotate(
                      angle: dateTime.second * 6 * pi / 180,
                      child: VerticalDivider(
                        color: Colors.green,
                        thickness: 2.5,
                        indent: 20,
                        endIndent: 90,
                      ),
                    ),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
