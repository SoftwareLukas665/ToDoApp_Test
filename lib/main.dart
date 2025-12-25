import 'package:flutter/material.dart';
import 'package:test_windows_projekt/listSide.dart';
import 'design_system/variables/app_colors.dart';
import 'database.dart';
import 'colorPalette_test.dart';

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
      theme: ThemeData(
        scaffoldBackgroundColor: Color(AppColors.backgroundValue),
      ),
      home: MainPage(database: database),
    );
  }
}

class MainPage extends StatefulWidget {
  final Database database;

  const MainPage({super.key, required this.database});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int pageIndex = 0;
  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [ListSide(database: widget.database), colorTest()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: Row(
            children: [
              Spacer(flex: 2),
              Container(
                height: 60,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[350],
                ),
                child: Row(
                  children: [
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          pageIndex = 0;
                        });
                      },
                      icon: Icon(Icons.home, size: 35),
                    ),

                    Spacer(),

                    IconButton(
                      onPressed: () {
                        setState(() {
                          pageIndex = 1;
                        });
                      },
                      icon: Icon(Icons.settings, size: 35),
                    ),

                    Spacer(),
                  ],
                ),
              ),

              Spacer(),

              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[350],
                ),
                child: Row(
                  children: [
                    Spacer(),

                    IconButton(
                      onPressed: () {
                        // setState(() {
                        //   pageIndex = 1;
                        // });
                        print("Settings Button gedrückt");
                      },
                      icon: Icon(Icons.add, size: 35),
                    ),

                    Spacer(),
                  ],
                ),
              ),

              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
