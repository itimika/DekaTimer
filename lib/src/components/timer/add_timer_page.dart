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
              OutlinedButton(
                onPressed: Provider.of<TimerModel>(context, listen: false)
                    .change5Minutes,
                child: const Text('+5'),
              ),
              _MinutePicker(),
              const Text(
                ':',
                style: TextStyle(fontSize: 50),
              ),
              _SecondPicker(),
              OutlinedButton(
                onPressed: Provider.of<TimerModel>(context, listen: false)
                    .change5Seconds,
                child: const Text('+5'),
              ),
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
                onPressed: () {
                  bool isSuccess =
                      Provider.of<TimerModel>(context, listen: false)
                          .addTimer();
                  if (isSuccess) {
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('時間を設定してください!')),
                    );
                  }
                },
                child: const Text('CREATE'),
              ),
            ],
          ),
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
      maxValue: maxMin,
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
      maxValue: maxSec,
      value: Provider.of<TimerModel>(context).s,
      onChanged: (value) =>
          Provider.of<TimerModel>(context, listen: false).changeSeconds(value),
    );
  }
}
