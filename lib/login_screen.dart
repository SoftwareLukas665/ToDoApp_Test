import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: Column(
        children: [
          AppBar(
            forceMaterialTransparency: true,
            //Verhindert Farbänderung der AppBar beim scrollen
            title: Text(
              "To-Do",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
            ),
            centerTitle: false,
          ),

          Text("Account erstellen"),

          Spacer(flex: 1),

          Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: screenWidth * 0.04,
            ),
            child: TextField(decoration: InputDecoration(hintText: "E-Mail")),
          ),

          Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: screenWidth * 0.04,
            ),
            child: TextField(decoration: InputDecoration(hintText: "Passwort")),
          ),

          Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: screenWidth * 0.04,
            ),
            child: TextField(decoration: InputDecoration(hintText: "Passwort wiederholen")),
          ),

          Spacer(flex: 1),

          //Anmelden Button
          SizedBox(
            height: 50,
            width: screenWidth*0.7 ,// meets Apple’s minimum 44pt
            child: ElevatedButton(
              child: const Text('Anmelden'),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                elevation: 0,
              ),
            ),
          ),

          Spacer(flex: 1),

          Divider(),

          Spacer(flex: 1),

          SizedBox(
            height: 50,
            width: screenWidth*0.7 ,// meets Apple’s minimum 44pt
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                elevation: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.apple, size: 27, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'Sign in with Apple',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.1,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(padding: EdgeInsetsGeometry.all(screenHeight*0.01)),

          SizedBox(
            height: 50,
            width: screenWidth*0.7 ,// meets Apple’s minimum 44pt
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                elevation: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  SvgPicture.asset('assets/images/24px.svg'),
                  SizedBox(width: 8),
                  Text(
                    'Sign in with Google',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.1,
                    ),
                  ),
                ],
              ),
            ),
          ),


          Spacer(flex: 2),

        ],
      ),
    );
  }
}
