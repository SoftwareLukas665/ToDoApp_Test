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

  String item = "";

  Widget build(BuildContext context) {


    //Überprüfung nach Filtereinstellungen des Nutzers
    Stream<Object?>? checkSortAndFilterOption (String? itemSelected) {
      //print("checkandsort-Funktion mit item-Wert = '" + item + "'");
      if (itemSelected != null){
        if (itemSelected == "Unerledigt"){
          //print("Hol nur unerledigte");
          return widget.database.getOnlyDoneFalse().watch();
        } else if (itemSelected == "Erledigt"){
          //print("Hol nur erledigte");
          return widget.database.getOnlyDoneTrue().watch();
        } else if (itemSelected == "ErledigtZuerst"){
          return widget.database.getDoneTrueFirst().watch();
        } else if (itemSelected == "UnerledigtZuerst"){
          return widget.database.getDoneFalseFirst().watch();
        } else if (itemSelected == ""){
          //print("Hol alle Aufgaben aber Selektion nicht null");
          return widget.database.getAllTasks().watch();
        }
      } else {
        //print("Hol alle Aufgaben aber Selektion ist null");
          return widget.database.getAllTasks().watch();
      }

    }

    String getSelectedItem (){
      //print("getSelectedItem ausgeführt");
      //print("getSelectedItem mit itemwert = '" + item + "' ausgeführt");
      return item;
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
              child: StreamBuilder(stream: checkSortAndFilterOption(getSelectedItem()) , builder: (context, snapshot) {
                if(!snapshot.hasData) {
                  return Text("Keine Daten vorhanden");
                } else if (snapshot.hasData) {
                  List fetchedTasks = snapshot.data! as List<dynamic>; //Das ist die Liste der Tasks
                  //print(fetchedTasks);

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
                        //print("item-Wert = '" + item + "' und Value-Wert = '" + value + "'");
                        item = value;
                        //print("item-Wert = '" + item + "' und Value-Wert = '" + value + "'");
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
                                //print("item-Wert = '" + item + "' und Value-Wert = '" + value + "'");
                                item = value;
                                //print("item-Wert = '" + item + "' und Value-Wert = '" + value + "'");
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
                                //widget.database.deleteTask(task.id);,

                                print("Objekt bearbeitet");
                                
                                showDialog(
                                  context: context,
                                  builder:  (BuildContext context) {
                                    return AlertDialog(
                                      actions: [

                                      ],
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text("Aufgabe bearbeiten"),

                                          TextField(decoration:
                                          InputDecoration(
                                              hintText: "Aufgabe eingeben",
                                              labelText: "Test"
                                          ),
                                            //controller: textEditingController,
                                          ),

                                          ElevatedButton(style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.black,
                                              foregroundColor: Colors.white),
                                              onPressed: () {
                                                print(textEditingController.text);
                                                //widget.database.createTask(textEditingController.text, false);
                                              }, child: Text("Änderungen bestätigen")
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                                
                                

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
