import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimerModel with ChangeNotifier {
  late Timer _timer;
  late DateTime _time;

  int _h = 0;
  int _m = 0;
  int _s = 0;

  get h => _h;
  get m => _m;
  get s => _s;

  String timerStr() => DateFormat('mm:ss').format(_time);

  changeHour(val) {
    _h = val;
    notifyListeners();
  }

  changeMinutes(val) {
    _m = val;
    notifyListeners();
  }

  changeSeconds(val) {
    _s = val;
    notifyListeners();
  }

  setTimer() {
    if (_h == 0 && _m == 0 && _s == 0) {
      _time = DateTime.utc(0, 0, 0).add(
        Duration(hours: _h, minutes: _m, seconds: _s),
      );
      notifyListeners();
    }
  }

  resetTimer() {
    _h = 0;
    _m = 0;
    _s = 0;
    notifyListeners();
  }

  startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _time = _time.add(const Duration(seconds: -1));
      notifyListeners();
      _handleTimeOver();
    });
  }

  void _handleTimeOver() {
    if (_time == DateTime.utc(0, 0, 0)) {
      _timer.cancel();
    }
  }
}
