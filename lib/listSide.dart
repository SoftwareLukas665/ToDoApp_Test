import 'package:flutter/material.dart';
import 'package:test_windows_projekt/database.dart';
import 'package:test_windows_projekt/taskSide.dart';

class listSide extends StatefulWidget {
  Database database = Database();

  listSide({super.key, required this.database});

  @override
  State<listSide> createState() => _listSideState();
}

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
              child: ListView.separated(

                 separatorBuilder: (
                BuildContext context,
                int index
                ) => const Padding(padding: EdgeInsetsGeometry.all(5)), //Padding der einzelnen Listen-Elemente

                padding: EdgeInsets.all(10), //Padding für die Liste als ganzes
                shrinkWrap: true,
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Material( //Material verhindert, dass die Liste unter anderen UI Elementen sichtbar bleibt
                    child: ListTile(
                      tileColor: Colors.grey[350],
                      contentPadding: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      title: Text("Test"),
                      trailing: Icon(Icons.chevron_right),
                      onTap: () {
                        Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => taskSide(database: database)
                    )
                  );
                      },
                    ),
                  );
                },)
          ),


        ],
      ),
    );
  }
}
