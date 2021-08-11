import 'package:deka_timer/src/app.dart';
import 'package:deka_timer/src/model/timer_model.dart';
import 'package:deka_timer/src/model/user_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() async {
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserModel.instance()),
        ChangeNotifierProvider(create: (_) => TimerModel()),
      ],
      child: const App(),
    ),
  );
}
