import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const maxMin = 59;
const maxSec = 59;

class TimerModel with ChangeNotifier {
  late Timer _timer;
  late DateTime _time;
  late CollectionReference _timers;
  late String userId;
  String _name = 'タイマー';

  int _h = 0;
  int _m = 0;
  int _s = 0;

  get h => _h;
  get m => _m;
  get s => _s;

  set name(val) => _name = val;

  CollectionReference get timers => _timers;

  String timerStr() => DateFormat('mm:ss').format(_time);

  changeHours(val) {
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

  change5Minutes() {
    _m += 5;
    if (maxMin < _m) {
      _m -= 60;
    }
    notifyListeners();
  }

  change5Seconds() {
    _s += 5;
    if (maxSec < _s) {
      _s -= 60;
    }
    notifyListeners();
  }

  readTimers(String id) {
    _timers = FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .collection('timers');
    notifyListeners();
  }

  bool addTimer() {
    if (_m != 0 || _s != 0) {
      _timers.add({
        'name': _name,
        'minute': _m,
        'second': _s,
        'background_color': '',
        'font_color': '',
      });
      return true;
    } else {
      return false;
    }
  }

  // setTimer() {
  //   if (_h == 0 && _m == 0 && _s == 0) {
  //     _time = DateTime.utc(0, 0, 0).add(
  //       Duration(hours: _h, minutes: _m, seconds: _s),
  //     );

  //     notifyListeners();
  //   }
  // }

  resetTimer() {
    _h = 0;
    _m = 0;
    _s = 0;
    notifyListeners();
  }

  startTimer(DocumentSnapshot doc) {
    _time = DateTime.utc(0, 0, 0).add(
        Duration(hours: _h, minutes: doc['minute'], seconds: doc['second']));
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
