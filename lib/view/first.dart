import 'dart:async';

import 'package:flutter/material.dart';

void main()
{
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

    Timer.periodic(
      Duration(seconds: 1),
        (timer){
        setState(() {
          dateTime = DateTime.now();
        });
        }
        );

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Digital Clock',style: TextStyle(
          color: Colors.white,fontWeight: FontWeight.w600
        ),),
        centerTitle: true,
        elevation: 10,
       shadowColor: Colors.black,
      ),
      body: Center(
        child: Container(
                color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${dateTime.hour % 12} :',style: TextStyle(
                color: Colors.white,
                fontSize: 60
              ),),
              Text(' ${dateTime.minute} : ',style: TextStyle(
                  color: Colors.white,
                  fontSize: 60
              ),),
              Text('${dateTime.second}',style: TextStyle(
                  color: Colors.white,
                  fontSize: 60
              ),),
            ],
          ),
        ),
      )
    );
  }
}
