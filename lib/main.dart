import 'package:flutter/material.dart';
import 'package:test_windows_projekt/colorPalette_test.dart';
import 'package:test_windows_projekt/listSide.dart';
import 'design_system/variables/app_colors.dart';
import 'database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = Database();

  runApp(MyApp(database: db));

}

class MyApp extends StatelessWidget {
  final Database database;

  const MyApp({super.key, required this.database});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: true,
      title: 'Flutter Demo',
      theme: new ThemeData(scaffoldBackgroundColor: Color(AppColors.backgroundValue)),
      /*theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),*/
      home: ListSide(database: database),
      //home: colorTest(),
    );
  }
}