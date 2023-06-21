import 'package:are_you_talented_too_2/login_navigated/sign_up_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../main.dart';
import 'about_app.dart';
import 'login_splash_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController f_email = TextEditingController();
  TextEditingController f_pasword = TextEditingController();


  @override
  Widget build(BuildContext context) {

    login() {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: f_email.text, password: f_pasword.text)
          .then((user) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const LoginSplashScreen()),
                (Route<dynamic> route) => false);
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: GestureDetector(
          onLongPress: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AboutApp()));
          },
          child: const Text("are you talented too",
              style: TextStyle(
                  fontSize: 18, color: color2, fontWeight: FontWeight.bold)),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("e-mail :"),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: TextFormField(
    controller: f_email,
    decoration: const InputDecoration(hintText: "example@gmail.com"),
    keyboardType: TextInputType.text,
    inputFormatters: [
    FilteringTextInputFormatter.singleLineFormatter
    ],
    ),
    ),

              const Text("password :"),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: TextFormField(
                  controller: f_pasword,
                  decoration: const InputDecoration(hintText: "your password"),
                  keyboardType: TextInputType.text,
                  inputFormatters: [
                    FilteringTextInputFormatter.singleLineFormatter
                  ],
                ),
              ),
              const Text("Are you interested in giving amateurs a chance?"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: login,
                      style: ElevatedButton.styleFrom(backgroundColor: color1),
                      child: const Text(
                        "Why not!",
                        style: TextStyle(
                          color: color2,
                        ),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => const AlertDialog(
                            content: Text(
                              "Than go away and find yourself one!",
                              style: (TextStyle(
                                fontStyle: FontStyle.italic,
                              )),
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: color1),
                      child: const Text(
                        "Just proffessionals",
                        style: TextStyle(
                          color: color2,
                        ),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpPage()));
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: color1),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: color2,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AboutApp()));
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: color1),
                          child: const Text(
                            "About App",
                            style: TextStyle(
                              color: color2,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
