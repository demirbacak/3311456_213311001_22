import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}



class _SignUpPageState extends State<SignUpPage> {

  TextEditingController f_name = TextEditingController();
  TextEditingController f_email = TextEditingController();
  TextEditingController f_password = TextEditingController();


  Future<void> signUp() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
        email: f_email.text, password: f_password.text)
        .then((user) {
      FirebaseFirestore.instance
          .collection("users")
          .doc(f_email.text)
          .set({
        "name": f_name.text,
        "email": f_email.text,
        "password": f_password.text,
      });
    }).whenComplete((){Navigator.push(context, MaterialPageRoute(builder:(context)=>const LoginPage(), ),);});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text("sign up",
            style: TextStyle(
                fontSize: 18, color: color2, fontWeight: FontWeight.bold)),
      ),
      body: ListView(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Name : ",
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: TextFormField(
                        controller: f_name,
                        decoration: const InputDecoration(),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    const Text("e-mail : "),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: TextFormField(
                        controller: f_email,
                        decoration: const InputDecoration(),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    const Text("Password : "),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: TextFormField(
                        controller: f_password,
                        decoration: const InputDecoration(),
                        keyboardType: TextInputType.text,
                      ),
                    ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  ElevatedButton(
                      onPressed: signUp,
                      style: ElevatedButton.styleFrom(backgroundColor: color1),
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                          color: color2,
                        ),
                      )),

                ],
              ),
            ),
          ],
        ),
            ),
    ],
    ),
    ],
    ),
    );
  }
}
