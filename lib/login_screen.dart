import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {


    final double screenWidth = MediaQuery.sizeOf(context).width;

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

          Text("Account erstellen"),
          Spacer(flex: 1),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: screenWidth*0.04),
            child: TextField(decoration:
            InputDecoration(
              hintText: "E-Mail",
            ),
            ),
          ),

          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: screenWidth*0.04),
            child: TextField(decoration:
            InputDecoration(
              hintText: "Passwort",
            ),
            ),
          ),

          Divider(),

          Spacer()
        ],
      ),
    );
  }
}
