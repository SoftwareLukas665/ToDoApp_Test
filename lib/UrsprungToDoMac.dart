/*

import 'package:flutter/material.dart';

class responsiveTest extends StatefulWidget {
  const responsiveTest({super.key});

  @override
  State<responsiveTest> createState() => _responsiveTestState();
}

class _responsiveTestState extends State<responsiveTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Container(
              color: Colors.green,
              child: Column(
                children: [
                  Spacer(flex: 1,),

                  TextField(
                    decoration: InputDecoration(
                      hintText: "Aufgabe eingeben",
                    ),
                  ),

                  Spacer(flex: 1),

                  ElevatedButton(onPressed: () {

                  }, child: Text("Bestätigen")
                  ),

                  Spacer(flex: 1)
                ],
              ),
            ),
          ),

          Divider(
            height: 0,
            color: Colors.black,
            thickness: 5,
          ),

          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: Container(
              color: Colors.red,
              child: ListView.builder(itemCount: 20, itemBuilder: (context, index) {
                print(index);

                return ListTile(
                  title: Text("Test" + index.toString()),
                );
              },),
            ),
          ),
        ],
      )
      )

    );
  }
}


 */