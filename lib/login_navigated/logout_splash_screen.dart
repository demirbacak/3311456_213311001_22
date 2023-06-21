import 'dart:async';
import 'package:flutter/material.dart';

import '../main.dart';
import 'login_page.dart';

class LogoutSplashScreen extends StatefulWidget {
  const LogoutSplashScreen({Key? key}) : super(key: key);

  @override
  State<LogoutSplashScreen> createState() => _LogoutSplashScreenState();
}

class _LogoutSplashScreenState extends State<LogoutSplashScreen> {


  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const LoginPage(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: color1,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "take care",
              style: TextStyle(
                color: color2,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
