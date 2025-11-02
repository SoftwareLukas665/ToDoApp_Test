import 'package:flutter/material.dart';
import 'package:test_windows_projekt/database.dart';
import 'package:test_windows_projekt/UI_files/popUpDialog/createList_dialog.dart';
import 'package:test_windows_projekt/taskSide.dart';
import 'design_system/variables/app_colors.dart';
import 'design_system/button/custom_RightDownButton.dart';


class ListSide extends StatefulWidget {

  final Database database;
  const ListSide({super.key, required this.database});

  @override
  State<ListSide> createState() => _ListSideState();
}

class _ListSideState extends State<ListSide> {
  late final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Button(
          icon: Icon(Icons.add, size: 70, color: AppColors.textPrimary),
          onPressed: () {
            showDialog(
                context: context,
                builder:  (BuildContext context) {
                  return CreateListDialog(textEditingController: textEditingController, database: widget.database,);
                }
            );
          }
      ),
      body: Column(
        children: [
          AppBar(
            forceMaterialTransparency: true, //Verhindert Farbänderung der AppBar beim scrollen
            title: const Text("UniList",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700
              ),
            ),
            centerTitle: false,
          ),

          Expanded(
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: StreamBuilder(
                  stream: widget.database.todolistDao.getAllLists(),
                  builder: (context, snapshot){
                    if (snapshot.hasData) {
                      List fetchedLists = snapshot.data! as List<dynamic>; //Das ist die Liste der Tasks

                      return ListView.separated(

                        separatorBuilder: (
                            BuildContext context,
                            int index) => const Padding(padding: EdgeInsets.all(5)), //Padding der einzelnen Listen-Elemente

                        padding: const EdgeInsets.all(10), //Padding für die Liste als ganzes
                        shrinkWrap: true,
                        itemCount: fetchedLists.length,
                        itemBuilder: (context, index) {
                          final list = fetchedLists[index];
                          return Material( //Material verhindert, dass die Liste unter anderen UI Elementen sichtbar bleibt
                            child: ListTile(
                              tileColor: AppColors.elementBackgroundLight, //Colors.grey[350],
                              contentPadding: const EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              title: Text(list.name),
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
                      return const Text("Unbekannter Fehler aufgetreten!");
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
