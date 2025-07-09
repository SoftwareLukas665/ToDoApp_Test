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
    late String item;

    //Überprüfung nach Filtereinstellungen des Nutzers
    Stream<Object?>? checkSortAndFilterOption (String? itemSelected) {
      if (itemSelected != null){
        if (itemSelected == "Unerledigt"){
          return widget.database.getOnlyDoneFalse().watch();
        } else if (itemSelected == "Erledigt"){
          return widget.database.getOnlyDoneTrue().watch();
        } else {
          return widget.database.getAllTasks().watch();
        }
      } else {
          return widget.database.getAllTasks().watch();
      }

    }

    void setSelectedItem (String filterinput){
      item = filterinput;
      print(item + " aus Setter-Methode");
    }







    TextEditingController textEditingController = TextEditingController();

    //Alle Variablen der Klasse
    final double screenWidth = MediaQuery.sizeOf(context).width;

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
            ), centerTitle: false,
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
                        }, child: Text("Bestätigen")
                    ),

                    Spacer(flex: 1),

                  ],
                )
              )
          ),

          Divider(height: 3, thickness: 3, color: Colors.black,),

          Expanded(
            flex: 2,
            child: Container(
              width: screenWidth,
              child: StreamBuilder(stream: checkSortAndFilterOption(null) , builder: (context, snapshot) {
                if(!snapshot.hasData) {
                  return Text("Keine Daten vorhanden");
                } else if (snapshot.hasData) {
                  List fetchedTasks = snapshot.data! as List<dynamic>; //Das ist die Liste der Tasks

                  return Column(children: [
                    PopupMenuButton(child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.filter_alt, color: Colors.white),
                    ),
                      onSelected: (value) {
                        String selectedItem = value;
                        setSelectedItem(value);
                        checkSortAndFilterOption(value);
                        print(value);
                      },
                      itemBuilder: (context) => <PopupMenuEntry<String>>[
                        PopupMenuItem<String>(value: "Erledigt", child: Row(children: [Text("Nur erledigte")],),),
                        PopupMenuItem<String>(value: "Unerledigt", child: Row(children: [Text("Nur unerledigte")]),),
                      ],
                    ),

                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: fetchedTasks.length, itemBuilder: (context, index) {
                        final task = fetchedTasks[index];
                        return ListTile(
                          title: Text(task.task),
                          trailing: Wrap(
                            spacing: 5,
                            children: [
                              IconButton(onPressed: () {
                                //widget.database.deleteTask(task.id);
                                print("Objekt bearbeitet");
                              }, icon: Icon(Icons.edit)),

                              IconButton(onPressed: () {
                                widget.database.deleteTask(task.id);
                              }, icon: Icon(Icons.delete)),
                            ],
                          ),
                          leading: Checkbox(value: task.done,
                            onChanged: (value) {
                              widget.database.updateTask(value!, task.id);
                            },
                          ),
                        );
                    }),
                    ],
                  );
                } else {
                  return Center(child: Text("Ein unbekannter Fehler ist aufgetreten!"),);
                }
              },),
            ),
          ),
        ],
      ),
    );
  }
}
