import 'package:deka_timer/src/components/home_page.dart';
import 'package:deka_timer/src/model/timer_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DbProcess extends StatelessWidget {
  final String? id;
  const DbProcess({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance!.addPostFrameCallback(
    //   (_) => ,
    // );
    Provider.of<TimerModel>(context, listen: false).readTimers(id!);
    return const HomePage();
  }
}
