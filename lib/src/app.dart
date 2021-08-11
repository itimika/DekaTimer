import 'package:deka_timer/src/model/timer_model.dart';
import 'package:deka_timer/src/route/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TimerModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark),
        initialRoute: initialPage,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
