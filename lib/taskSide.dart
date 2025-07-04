import 'package:flutter/material.dart';
import 'package:test_windows_projekt/database.dart';

class taskSide extends StatefulWidget {
  Database database = Database();

  taskSide({super.key, required this.database});

  @override
  State<taskSide> createState() => _taskSideState();
}

class _taskSideState extends State<taskSide> {
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

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
                        controller: textEditingController,
                      ),
                    ),

                    Spacer(),

                    ElevatedButton(style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white),
                        onPressed: () {
                          print(textEditingController.text);
                          widget.database.createTask(textEditingController.text, false);
                          setState(() {

                          });
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
              child: FutureBuilder(
                  future: widget.database.getAllTasks().get(),
                  builder: (context, snapshot) {
                    if(!snapshot.hasData) {
                      return Text("Keine Daten vorhanden");
                    } else if (snapshot.hasData) {
                      List fetchedTasks = snapshot.data!; //Das ist die Liste der Tasks

                      return ListView.builder(
                          itemCount: fetchedTasks.length, itemBuilder: (context, index) {
                            final task = fetchedTasks[index];
                        return ListTile(
                          title: Text(task.task), //Fehler: task ist nicht definiert
                        );
                      });
                    } else {
                      return Center(child: Text("Fehler!"),);
                    }
                  },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
