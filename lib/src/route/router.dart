import 'package:deka_timer/src/components/account/login_check.dart';
import 'package:deka_timer/src/components/timer/add_timer_page.dart';
import 'package:deka_timer/src/components/home.dart';
import 'package:deka_timer/src/components/timer/set_timer_page.dart';
import 'package:deka_timer/src/components/timer/timer_page.dart';
import 'package:flutter/material.dart';

const String initialPage = '/';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const LoginCheck());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/timer':
        return MaterialPageRoute(builder: (_) => const TimerPage());
      case '/addTimer':
        return MaterialPageRoute(builder: (_) => const AddTimerPage());
      case '/setTimer':
        return MaterialPageRoute(builder: (_) => const SetTimerPage());
      // return PageRouteBuilder(
      //   pageBuilder: (_, __, ___) => const SetTimerPage(),
      //   transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //     return const ZoomPageTransitionsBuilder().buildTransitions(
      //       MaterialPageRoute(builder: (_) => const SetTimerPage()),
      //       context,
      //       animation,
      //       secondaryAnimation,
      //       child,
      //     );
      //   },
      //   fullscreenDialog: true,
      // );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No route defined for ${settings.name}"),
            ),
          ),
        );
    }
  }
}
