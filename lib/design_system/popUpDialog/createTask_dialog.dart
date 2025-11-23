import 'package:flutter/material.dart';
import 'package:test_windows_projekt/database.dart';
import 'package:test_windows_projekt/design_system/button/custom_MainButton.dart';

class CreateTaskDialog extends StatelessWidget {
  final TextEditingController textEditingController;
  final Database database;
  final int list_id;

  const CreateTaskDialog({
    super.key,
    required this.textEditingController,
    required this.database,
    required this.list_id,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Neue Liste erstellen"),
          TextField(
            decoration: const InputDecoration(
              hintText: "Name der Liste",
            ),
            controller: textEditingController,
          ),

          MainButton(
            text: "Bestätigen",
            onPressed: () {
              Navigator.of(context).pop();
              print("Aufgabe: ${textEditingController.text} wird hinzugefügt");
              database.taskDao.createTask(textEditingController.text, list_id);
              textEditingController.clear();
            },
          ),
        ],
      ),
    );
  }
}