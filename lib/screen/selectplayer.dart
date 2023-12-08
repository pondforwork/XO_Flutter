import 'package:flutter/material.dart';
import 'package:xo_flutter/screen/play.dart';

class selectplayer extends StatefulWidget {
  const selectplayer({super.key});

  @override
  State<selectplayer> createState() => _selectplayerState();
}

class _selectplayerState extends State<selectplayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Column(
      children: [
        const SizedBox(
          height: 200,
        ),
        const Column(
          children: [
            Center(
              child: Text(
                "Select First Player",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40),
              ),
            )
          ],
        ),const SizedBox(
          height: 150,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                  color: Colors.blue, // Set the background color here
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    splashColor: Colors.green,
                    onTap: () {
                      print("Test");
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return const PlayGame(initialXTurn: true,); }));
                    },
                    child: const SizedBox(
                      width: 150,
                      height: 150,
                      child: Center(
                        child: SizedBox(
                          width: 150,
                          height: 150,
                          child: Center(
                            child: Text(
                              'X',
                              style:
                                  TextStyle(fontSize: 80, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
            ),
            Card(
                color: Colors.red, // Set the background color here
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  splashColor: Colors.green,
                  onTap: () {
                    print("Test");
                  },
                  child: const SizedBox(
                    width: 150,
                    height: 150,
                    child: Center(
                      child: Text(
                        'O',
                        style: TextStyle(fontSize: 80, color: Colors.white),
                      ),
                    ),
                  ),
                )),
          ],
        )
      ],
    ));
  }
}
