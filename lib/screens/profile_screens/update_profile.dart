import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../main.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {

  TextEditingController f_name = TextEditingController();
  TextEditingController f_email = TextEditingController();
  TextEditingController f_password = TextEditingController();


   update() {
      FirebaseFirestore.instance
          .collection("users")
          .doc(f_email.text)
          .update({
        "name": f_name.text,
        "email": f_email.text,
        "password": f_password.text,
      }).whenComplete(() {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            content: Text(
              "Finished!",
              style: (TextStyle(
                fontStyle: FontStyle.italic,
              )),
            ),
          ),
        );
      }, );
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text("update profile",
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
                            onPressed: update,
                            style: ElevatedButton.styleFrom(backgroundColor: color1),
                            child: const Text(
                              "Update",
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
