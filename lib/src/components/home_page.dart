import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deka_timer/src/model/timer_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sprintf/sprintf.dart';

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
      body: StreamBuilder<QuerySnapshot>(
        stream: Provider.of<TimerModel>(context).timers.snapshots(),
        builder: (conetxt, snapshot) {
          if (snapshot.hasData) {
            final List<DocumentSnapshot> docs = snapshot.data!.docs;
            return Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.count(
                crossAxisCount: 2,
                children: docs.map(
                  (doc) {
                    return _gridWidget(doc);
                  },
                ).toList(),
              ),
            );
          } else {
            return const Text("can't read");
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: () {},
      ),
    );
  }

  Widget _gridWidget(DocumentSnapshot? doc) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                flex: 2,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(doc!['name'], textAlign: TextAlign.center),
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
          Card(
            // decoration: BoxDecoration(
            //     color: Colors.white,
            //     border: Border.all(color: Colors.black, width: 3),
            //     borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Center(
              child: _TimeComponent(doc: doc),
            ),
          ),
        ],
      ),
    );
  }
}

class _TimeComponent extends StatelessWidget {
  final DocumentSnapshot? doc;
  const _TimeComponent({Key? key, required this.doc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<TimerModel>(context, listen: false).startTimer(doc!);
        Navigator.pushNamed(context, '/timer');
      },
      child: Text(
        sprintf("%02i:%02i", [
          doc!['minute'],
          doc!['second'],
        ]),
        style: const TextStyle(fontSize: 50),
      ),
    );
  }
}
