import 'dart:async';
import 'package:flutter/material.dart';

import '../main.dart';
import 'base_scaffold.dart';

class LoginSplashScreen extends StatefulWidget {
  const LoginSplashScreen({Key? key}) : super(key: key);

  @override
  State<LoginSplashScreen> createState() => _LoginSplashScreenState();
}

class _LoginSplashScreenState extends State<LoginSplashScreen> {


  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => const BaseScaffold(),
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
              "say hi to",
              style: TextStyle(
                color: color2,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "fames of tomorrow",
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
