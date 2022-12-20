import 'package:event_scheduler/new_event.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Widget> _list = [
    // ListTile(
    //   tileColor: Colors.white,
    //   title: Text("Demo Widget"),
    //   horizontalTitleGap: 12,
    // )
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('Event Scheduler'),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          color: Colors.deepPurpleAccent,
          child: ListView.builder(
              itemCount: _list.length,
              itemBuilder: ((BuildContext context, int index) {
                return _list[index];
              })),
        ),
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            onPressed: () async {
              String newText = await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => NewEventScreen()));
              setState(() {
                _list.add(Card(
                    child: ListTile(
                    title: Center(child: Text(newText,textAlign: TextAlign.center,) ))
                ));
              });
            },
            child: Icon(Icons.add),
          );
        }),
      ),
    );
  }
}
