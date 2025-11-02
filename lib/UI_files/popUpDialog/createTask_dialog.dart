import 'package:flutter/material.dart';
import 'package:test_windows_projekt/database.dart';
import 'package:test_windows_projekt/design_system/button/custom_MainButton.dart';

class CreateListDialog extends StatelessWidget {
  final TextEditingController textEditingController;
  final Database database;

  const CreateListDialog({
    super.key,
    required this.textEditingController,
    required this.database,
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
              print(textEditingController.text);
              database.todolistDao.createList(textEditingController.text);
              textEditingController.clear();
            },
          ),
        ],
      ),
    );
  }
}
