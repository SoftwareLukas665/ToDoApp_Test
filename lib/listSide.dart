import 'package:flutter/material.dart';
import 'package:test_windows_projekt/database.dart';
import 'package:test_windows_projekt/taskSide.dart';


class listSide extends StatefulWidget {

  final Database database;


  listSide({super.key, required this.database});

  @override
  State<listSide> createState() => _listSideState();
}
TextEditingController textEditingController = TextEditingController();

class _listSideState extends State<listSide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            forceMaterialTransparency: true, //Verhindert Farbänderung der AppBar beim scrollen
            title: Text("To-Do",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700
              ),
            ),
            centerTitle: false,
          ),

          Align(
            alignment: Alignment.centerLeft,
            child: Text("Meine Listen"),
          ),

          Expanded(
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                child: StreamBuilder(
                  stream: widget.database.todolistDao.getAllLists(),
                  builder: (context, snapshot){
                    if (snapshot.hasData) {
                      List fetchedLists = snapshot.data! as List<dynamic>; //Das ist die Liste der Tasks

                      return ListView.separated(

                        separatorBuilder: (
                            BuildContext context,
                            int index) => const Padding(padding: EdgeInsetsGeometry.all(5)), //Padding der einzelnen Listen-Elemente

                        padding: EdgeInsets.all(10), //Padding für die Liste als ganzes
                        shrinkWrap: true,
                        itemCount: fetchedLists.length,
                        itemBuilder: (context, index) {
                          final list = fetchedLists[index];
                          return Material( //Material verhindert, dass die Liste unter anderen UI Elementen sichtbar bleibt
                            child: ListTile(
                              tileColor: Colors.grey[350],
                              contentPadding: EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              title: Text(list.name),
                              leading: Text(list.id.toString()),
                              trailing: Icon(Icons.chevron_right),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => taskSide(database: widget.database, list_id: list.id)
                                    )
                                );
                              },
                            ),
                          );
                        },
                      );

                    } else {
                      return Text("Unbekannter Fehler aufgetreten!");
                    }
                  },
                ),
              ),
          ),

          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(
                    side: BorderSide(
                      color: Colors.black,
                      width: 2,
                    )
                ),
                backgroundColor: Colors.black,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder:  (BuildContext context) {
                    return AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Neue Liste erstellen"),
                          TextField(decoration:
                          InputDecoration(
                            hintText: "Name der Liste",
                          ),
                            controller: textEditingController,
                          ),
                          ElevatedButton(style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white),
                              onPressed: () {
                                Navigator.of(context).pop();
                                print(textEditingController.text);
                                widget.database.todolistDao.createList(textEditingController.text);
                                textEditingController.clear();
                              }, child: Text("Bestätigen")
                          ),
                        ],
                      ),
                    );
                  }
                );
              },
              child: Container(
                child: Icon(Icons.add, color: Colors.white, size: 30,),

              ),
            ),
          ),




        ],
      ),
    );
  }
}
