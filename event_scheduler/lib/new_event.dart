import 'package:event_scheduler/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewEventScreen extends StatefulWidget {
  const NewEventScreen({Key? key}) : super(key: key);

  @override
  State<NewEventScreen> createState() => _NewEventScreenState();
}

class _NewEventScreenState extends State<NewEventScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  bool submit = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController.addListener(() {
      setState(() {
        submit = _textEditingController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _textEditingController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MyApp()));
              },
            );
          },
        ),
        title: Text("New Event"),
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textEditingController,
              // maxLines: 3,
              decoration: InputDecoration(
                // contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    )),
                prefixIcon: Icon(
                  Icons.today,
                  color: Colors.white,
                ),

                hintText: 'Event',
                hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    textBaseline: TextBaseline.alphabetic),
                filled: true,
                fillColor: Colors.deepPurple,
              ),
              style: TextStyle(color: Colors.white),
              minLines: 1,
              maxLines: 3,
            ),
            Builder(builder: (context) {
              return Container(
                padding: EdgeInsetsDirectional.only(top: 10),
                height: 55,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white38,
                      textStyle: TextStyle(color: Colors.white),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                    ),
                    onPressed: submit
                        ? () {
                            String newEventText = _textEditingController.text;
                            Navigator.of(context).pop(newEventText);
                          }
                        : null,
                    child: Text("ADD")),
              );
            })
          ],
        ),
      ),
    );
  }
}
