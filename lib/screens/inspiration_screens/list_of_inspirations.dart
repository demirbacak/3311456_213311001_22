import "package:flutter/material.dart";
import '../../login_navigated/base_scaffold.dart';
import '../../main.dart';
import '../../models/inspirations_model.dart';
import '../../services/local_db_utils.dart';
import 'inspiration_detail_screen.dart';

LocalDbUtils utils = LocalDbUtils();

class ListofInspirations extends StatefulWidget {
  const ListofInspirations({super.key});

  @override
  _ListofInspirationsState createState() => _ListofInspirationsState();
}

class _ListofInspirationsState extends State<ListofInspirations> {
  List<Inspiration> inspirationList = [];

  void getData() async {
    await utils.inspirations().then((result) => {
      setState(() {
        inspirationList = result;
      })
    });
    //print(inspirationList);
  }

  void showAlert(String alertTitle, String alertContent) {
    AlertDialog alertDialog;
    alertDialog =
        AlertDialog(title: Text(alertTitle), content: Text(alertContent));
    showDialog(context: context, builder: (_) => alertDialog);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("inspiration list",
          style: TextStyle(
          fontSize: 18, color: color2, fontWeight: FontWeight.bold)),
        backgroundColor: color1,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: inspirationList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(inspirationList[index].title,
                      style: const TextStyle(
                        color: color1,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return InspirationDetailScreen(/*id: inspirationList[index].id,*/ title:inspirationList[index].title , content: inspirationList[index].content);
                          }));
                    },
                    onLongPress: () async {
                      await utils.deleteInspiration(inspirationList[index].title).then((value) => {
                        showAlert("Inspiration " + index.toString() + " deleted",
                            "Inspiration " + index.toString() + " deleted")
                      });
                      getData();
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: color1),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BaseScaffold()),
                    );
                  },
                  child: const Text("Return Mainpage",
                    style: TextStyle(
                      color: color2,
                    ),
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}