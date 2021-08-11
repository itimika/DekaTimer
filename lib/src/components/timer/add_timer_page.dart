import 'package:deka_timer/src/model/timer_model.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

class AddTimerPage extends StatelessWidget {
  const AddTimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('タイマーを追加'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _MinutePicker(),
              _SecondPicker(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                onPressed:
                    Provider.of<TimerModel>(context, listen: false).resetTimer,
                child: const Text('RESET'),
              ),
              ElevatedButton(
                onPressed:
                    Provider.of<TimerModel>(context, listen: false).addTimer,
                child: const Text('CREATE'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _MinutePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NumberPicker(
      selectedTextStyle:
          TextStyle(color: Theme.of(context).indicatorColor, fontSize: 50),
      textStyle: const TextStyle(fontSize: 20),
      infiniteLoop: true,
      zeroPad: true,
      minValue: 0,
      maxValue: 59,
      value: Provider.of<TimerModel>(context).m,
      onChanged: (value) =>
          Provider.of<TimerModel>(context, listen: false).changeMinutes(value),
    );
  }
}

class _SecondPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NumberPicker(
      selectedTextStyle:
          TextStyle(color: Theme.of(context).indicatorColor, fontSize: 50),
      textStyle: const TextStyle(fontSize: 20),
      infiniteLoop: true,
      zeroPad: true,
      minValue: 0,
      maxValue: 59,
      value: Provider.of<TimerModel>(context).s,
      onChanged: (value) =>
          Provider.of<TimerModel>(context, listen: false).changeSeconds(value),
    );
  }
}
