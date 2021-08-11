import 'package:deka_timer/src/route/router.dart';
import 'package:deka_timer/src/settings/locale.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      locale: locale,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: const [locale],
      initialRoute: initialPage,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
