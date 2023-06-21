import 'package:flutter/material.dart';
import '../main.dart';
import 'login_page.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: GestureDetector(
          onLongPressUp: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LoginPage()));
          },
          child: const Text("about app",
              style: TextStyle(
                  fontSize: 18, color: color2, fontWeight: FontWeight.bold)),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "     Bu uygulama Mobil Programlama Dersi kapsamında Mustafa Demirbacak tarafından geliştirilmiştir.",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: color1),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      },
                      child: const Text(
                        "Login Page",
                        style: TextStyle(color: color2),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Selçuk Üniversitesi",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                            )),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Teknoloji Fakültesi",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                            )),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Bilgisayar Mühendisliği",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                            )),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("2022-2023 Bahar Dönemi",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
