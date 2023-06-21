import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../main.dart';

class UserProfile extends ConsumerWidget {
  const UserProfile({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text("user profile",
            style: TextStyle(
                fontSize: 18, color: color2, fontWeight: FontWeight.bold)),
      ),
      body: const UserInformation(),
    );
  }
}

class UserInformation extends StatefulWidget {
  const UserInformation({super.key});

  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {

  Query userInformation = FirebaseFirestore.instance.collection('users').where('email', isEqualTo: FirebaseAuth.instance.currentUser?.email);

  //final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('kullanicilar').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: userInformation.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return ListTile(
              leading: Text(data['name']),
              title: Text(data['email']),
              subtitle: Text(data['password']),
            );
          }).toList(),
        );
      },
    );
  }
}


/*class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "Name : ",
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                decoration: const InputDecoration(),
                keyboardType: TextInputType.text,
              ),
            ),
            const Text("Surname : "),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                decoration: const InputDecoration(),
                keyboardType: TextInputType.text,
              ),
            ),
            const Text("Tel : "),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                decoration: const InputDecoration(),
                keyboardType: TextInputType.number,
              ),
            ),
            const Text("e-mail : "),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                decoration: const InputDecoration(),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const Text("Name : "),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                decoration: const InputDecoration(),
                keyboardType: TextInputType.text,
              ),
            ),
            const Text("Adress : "),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                decoration: const InputDecoration(),
                keyboardType: TextInputType.text,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const AlertDialog(
                      content: Text(
                        "Saved",
                        style: (TextStyle(
                          fontStyle: FontStyle.italic,
                        )),
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: color1),
                child: const Text(
                  "Save",
                  style: TextStyle(
                    color: color2,
                  ),
                )),
          ]
          ),
        ),

      ]),
    );
  }
}*/
/*
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text("profile",
            style: TextStyle(
                fontSize: 18, color: color2, fontWeight: FontWeight.bold)),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "Name : ",
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                decoration: const InputDecoration(),
                keyboardType: TextInputType.text,
              ),
            ),
            const Text("Surname : "),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                decoration: const InputDecoration(),
                keyboardType: TextInputType.text,
              ),
            ),
            const Text("Tel : "),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                decoration: const InputDecoration(),
                keyboardType: TextInputType.number,
              ),
            ),
            const Text("e-mail : "),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                decoration: const InputDecoration(),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const Text("Name : "),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                decoration: const InputDecoration(),
                keyboardType: TextInputType.text,
              ),
            ),
            const Text("Adress : "),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                decoration: const InputDecoration(),
                keyboardType: TextInputType.text,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const AlertDialog(
                      content: Text(
                        "Saved",
                        style: (TextStyle(
                          fontStyle: FontStyle.italic,
                        )),
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: color1),
                child: const Text(
                  "Save",
                  style: TextStyle(
                    color: color2,
                  ),
                )),
          ]
          ),
        ),

      ]),
      persistentFooterButtons: [
        buildFooterButtons(context),
      ],
    );
  }
}
 */
