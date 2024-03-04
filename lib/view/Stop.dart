import 'package:flutter/material.dart';

class TimerAppScreen extends StatefulWidget {
  const TimerAppScreen({super.key});

  @override
  State<TimerAppScreen> createState() => _TimerAppScreenState();
}

int second = 60;
int count = 1;

class _TimerAppScreenState extends State<TimerAppScreen> {
  Future<void> timerFunction() async {
    await Future.delayed(
      Duration(seconds: 1),
      () {
        if (second > 0) {
          second--;
          setState(() {});
          timerFunction();
        }
      },
    );
  }

  //
  // @override
  // void initState() {
  //   timerFunction();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count++;
          });
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 200,
                width: 200,
                child: CircularProgressIndicator(
                  value: second / 60,
                )),
            SizedBox(
              height: 50,
            ),
            Text(
              '$second',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    second *= count;
                  });

                  timerFunction();
                },
                child: Text('$count minute')),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    second = 60;
                  });
                },
                child: Text('Reset')),
          ],
        ),
      ),
    );
  }
}
