import 'package:deka_timer/src/components/home.dart';
import 'package:deka_timer/src/model/timer_model.dart';
import 'package:deka_timer/src/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginCheck extends StatelessWidget {
  const LoginCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, UserModel user, _) {
        switch (user.status) {
          case Status.uninitialized:
            return const Scaffold(
              body: Center(
                child: Text('O _ O'),
              ),
            );
          case Status.unauthenticated:
          case Status.authenticating:
            user.signInAnonymously();
            return const Scaffold(
              body: Center(
                child: Text('O _ O'),
              ),
            );
          case Status.authenticated:
            Provider.of<TimerModel>(context, listen: false)
                .readTimers(user.id());
            return const HomePage();
        }
      },
    );
  }
}
