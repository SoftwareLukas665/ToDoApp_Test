import 'package:flutter/material.dart';

class taskSide extends StatefulWidget {
  const taskSide({super.key});

  @override
  State<taskSide> createState() => _taskSideState();
}

class _taskSideState extends State<taskSide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
                color: Colors.green,
                width: MediaQuery.sizeOf(context).width,
                child: Column(
                  children: [
                    Spacer(),

                    TextField(decoration: InputDecoration(hintText: "Aufgabe eingeben"),),
                    ElevatedButton(style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white), onPressed: () {

                    }, child: Text("Bestätigen")
                    ),

                    Spacer()
                  ],
                )
              )
          ),

          Expanded(
            flex: 2,
              child: Container(
                color: Colors.red,
                width: MediaQuery.sizeOf(context).width,
                child: Center(
                  child: Text("Test"),
                ),
              )
          ),
        ],
      ),
    );
  }
}
