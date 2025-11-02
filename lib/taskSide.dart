import 'package:flutter/material.dart';
import 'package:test_windows_projekt/database.dart';
import 'package:test_windows_projekt/design_system/button/custom_MainButton.dart';

class taskSide extends StatefulWidget {
  final Database database;
  final int list_id;

  taskSide({super.key, required this.database, required this.list_id});

  @override
  State<taskSide> createState() => _taskSideState();
}


class _taskSideState extends State<taskSide> {
  @override


  Widget build(BuildContext context) {

    TextEditingController textEditingController = TextEditingController();
    TextEditingController editTaskController = TextEditingController();
    String item = "";


    //Überprüfung nach Filtereinstellungen des Nutzers
    Stream<Object?>? checkSortAndFilterOption (String? itemSelected) {
      if (itemSelected == "Unerledigt") {
        print("Unerledigt");
        return widget.database.taskDao.getOnlyDoneFalse(widget.list_id);
      } else if (itemSelected == "Erledigt") {
        print("Erledigt");
        return widget.database.taskDao.getOnlyDoneTrue(widget.list_id);
      } else if (itemSelected == "ErledigtZuerst") {
        print("ErledigtZuerst");
        return widget.database.taskDao.getDoneTrueFirst(widget.list_id);
      } else if (itemSelected == "UnerledigtZuerst") {
        print("UnerledigtZuerst");
        return widget.database.taskDao.getDoneFalseFirst(widget.list_id);
      } else {
        print("Alle Aufgaben");
        return widget.database.taskDao.getAllTasks(widget.list_id);
      }
    }

    String getSelectedItem (){
      return item;
    }

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
            ),
            centerTitle: false,
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
                        ),
                        controller: textEditingController,
                      ),
                    ),

                    Spacer(),

                    // ElevatedButton(style: ElevatedButton.styleFrom(
                    //     backgroundColor: Colors.black,
                    //     foregroundColor: Colors.white),
                    //     onPressed: () {
                    //       widget.database.taskDao.createTask(textEditingController.text, widget.list_id);
                    //       textEditingController.clear();
                    //     }, child: Text("Bestätigen")
                    // ),

                    MainButton(
                      text: "Bestätigen",
                      onPressed: (){
                        widget.database.taskDao.createTask(textEditingController.text, widget.list_id);
                        textEditingController.clear();
                      },
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
              child: StreamBuilder(stream: checkSortAndFilterOption(getSelectedItem()) , builder: (context, snapshot) {
                if(!snapshot.hasData) {
                  return Text("Keine Daten vorhanden");
                } else if (snapshot.hasData) {
                  List fetchedTasks = snapshot.data! as List<dynamic>; //Das ist die Liste der Tasks

                  return Column(children: [
                    PopupMenuButton(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.filter_alt, color: Colors.white),
                      ),
                      onSelected: (value) {
                        setState(() {
                        item = value;
                        checkSortAndFilterOption(item);
                        
                        });
                      },
                      itemBuilder: (context) => <PopupMenuEntry<String>>[
                        PopupMenuItem<String>(value: "Erledigt", child: Row(children: [Text("Nur erledigte")],),),
                        PopupMenuItem<String>(value: "Unerledigt", child: Row(children: [Text("Nur unerledigte")]),),
                        PopupMenuItem<String>(child: Row(children: [
                          PopupMenuButton(
                            onSelected: (value) {
                              setState(() {
                                item = value;
                                checkSortAndFilterOption(item);
                              });
                            },
                            child: Text("Sortieren nach"),
                            itemBuilder: (context) => <PopupMenuEntry<String>>[
                              PopupMenuItem<String>(value: "ErledigtZuerst", child: Row(children: [Text("Erledigte zuerst")]),),
                              PopupMenuItem<String>(value: "UnerledigtZuerst", child: Row(children: [Text("Unerledigte zuerst")]),),
                            ],
                          ),
                        ],),),
                      ],
                    ),

                    Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: fetchedTasks.length,
                            itemBuilder: (context, index) {
                          final task = fetchedTasks[index];
                          return ListTile(
                            title: Text(task.task),
                            trailing: Wrap(
                              spacing: 5,
                              children: [
                                IconButton(onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder:  (BuildContext context) {

                                      editTaskController.text = task.task;

                                      return AlertDialog(
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text("Aufgabe bearbeiten"),

                                            TextField(decoration:
                                            InputDecoration(
                                              hintText: task.task,
                                            ),
                                              controller: editTaskController,
                                            ),

                                            ElevatedButton(style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.black,
                                                foregroundColor: Colors.white),
                                                onPressed: () {
                                                  widget.database.taskDao.changeTask(task.id, editTaskController.text);
                                                  Navigator.of(context).pop();
                                                  editTaskController.clear();
                                                }, child: Text("Änderungen bestätigen")
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                }, icon: Icon(Icons.edit)),

                                IconButton(onPressed: () {
                                  widget.database.taskDao.softDeleteTask(task.id);
                                }, icon: Icon(Icons.delete)),
                              ],
                            ),
                            leading: Checkbox(value: task.done,
                              onChanged: (value) {
                                widget.database.taskDao.updateTask(task.id, value!);
                              },
                            ),
                          );
                        }),
                    )


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
