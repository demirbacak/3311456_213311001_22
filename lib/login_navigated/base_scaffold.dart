import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../riverpod/riverpod_management.dart';
import 'bottom_nav_bar.dart';
import '../main.dart';
import 'logout_splash_screen.dart';

class BaseScaffold extends ConsumerStatefulWidget {
  const BaseScaffold({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends ConsumerState<BaseScaffold> {
  @override
  Widget build(BuildContext context) {
    var watch = ref.watch(bottomNavBarRiverpod);
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      appBar: //appbarBuild(watch),
      AppBar(
        backgroundColor: color1,
        title: Text(watch.appbarTitle(),
            style: TextStyle(
                fontSize: 18, color: color2, fontWeight: FontWeight.bold)
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) => {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => LogoutSplashScreen()),
                        (Route<dynamic> route) => false)
              });
            },
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: watch.body(),
    );
  }
}