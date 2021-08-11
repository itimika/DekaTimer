import 'package:deka_timer/src/model/timer_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        padding: const EdgeInsets.all(30),
        child: Center(
          child: _TimeComponent(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}

class _TimeComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      Provider.of<TimerModel>(context).timerStr(),
      style: const TextStyle(
        fontSize: 120,
        color: Colors.black,
      ),
    );
  }
}
