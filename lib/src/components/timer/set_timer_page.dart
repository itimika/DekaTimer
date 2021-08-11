import 'package:flutter/material.dart';

class SetTimerPage extends StatelessWidget {
  const SetTimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Set Timer!"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "12:00",
              style: TextStyle(fontSize: 120),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text('BACK'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('START'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
