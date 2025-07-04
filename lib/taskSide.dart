import 'package:flutter/material.dart';

class taskSide extends StatefulWidget {
  const taskSide({super.key});

  @override
  State<taskSide> createState() => _taskSideState();
}

class _taskSideState extends State<taskSide> {
  @override
  Widget build(BuildContext context) {

    //Alle Variablen der Klasse
    final double screenWidth = MediaQuery.sizeOf(context).width;

    //Datenbank

    //User-Interface
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            forceMaterialTransparency: true, //Verhindert Farbänderung der AppBar beim scrollen
            title: Text("To-Do", style:
              TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700
              ),
            ), centerTitle: false, //backgroundColor: Colors.grey[250],
          ),
          
          Expanded(
              child: Container(
                width: screenWidth,
                child: Column(
                  children: [
                    Spacer(flex: 2),

                    Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: screenWidth*0.04),
                      child: TextField(decoration:
                        InputDecoration(
                            hintText: "Aufgabe eingeben",
                            labelText: "Test"
                        ),
                      ),
                    ),

                    Spacer(),

                    ElevatedButton(style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white),
                        onPressed: () {
                          //Aktion eifügen
                        }, child: Text("Bestätigen")
                    ),

                    Spacer(flex: 1)
                  ],
                )
              )
          ),

          Divider(height: 3, thickness: 3, color: Colors.black,),

          Expanded(
            flex: 2,
            child: Container(
              width: screenWidth,
              child: ListView.builder(itemCount: 20, itemBuilder: (context, index) {
                //print(index.toString() + "x Objekt der Liste");

                return ListTile(
                  title: Text("Test" + index.toString())
                );
              },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
