import 'package:flutter/material.dart';

void main()
{
  runApp(const Timer());
}

class Timer extends StatefulWidget {
  const Timer({super.key});

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: Text('Timer',style: TextStyle(
        color: Colors.teal,
        fontSize: 25,
        fontWeight: FontWeight.w600
      ),),
        
        actions: [
          Icon(Icons.more_vert)
        ],
      ),
    );
  }
}
