import 'package:deka_timer/src/model/timer_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/addTimer'),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.2,
          ),
          itemBuilder: (BuildContext context, int index) {
            return _gridWidget(index);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        // いまだけ
        onPressed: () {
          Provider.of<TimerModel>(context, listen: false).setTimer();
          Navigator.pushNamed(context, '/timer');
        },
      ),
    );
  }

  Widget _gridWidget(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Flexible(
                flex: 2,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text("休憩時間", textAlign: TextAlign.center),
                ),
              ),
              Flexible(
                flex: 1,
                child: SizedBox(
                  height: 18,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: SizedBox(
                  height: 18,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.palette,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Card(
            // decoration: BoxDecoration(
            //     color: Colors.white,
            //     border: Border.all(color: Colors.black, width: 3),
            //     borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Center(
              child: _TimeComponent(),
            ),
          ),
        ],
      ),
    );
  }
}

class _TimeComponent extends StatelessWidget {
  const _TimeComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/setTimer'),
      child: const Text(
        "12:00",
        style: TextStyle(fontSize: 50),
      ),
    );
  }
}
