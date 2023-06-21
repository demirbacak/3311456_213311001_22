import "package:flutter/material.dart";
import 'package:sqflite/sqflite.dart';
import '../../main.dart';
import '../../models/inspirations_model.dart';
import '../../services/local_db_utils.dart';
import '../inspiration_screens/list_of_inspirations.dart';

LocalDbUtils utils = LocalDbUtils();

class InspirationsScreen extends StatefulWidget {
  const InspirationsScreen({Key? key}) : super(key: key);

  @override
  _InspirationsScreenState createState() => _InspirationsScreenState();
}

class _InspirationsScreenState extends State<InspirationsScreen> {
  //TextEditingController idController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  late Future<Database> database;

  List<Inspiration> inspirationList = [];

  _onPressedUpdate() async {
    final theInspiration = Inspiration(
      //id: int.parse(idController.text),
      title: titleController.text,
      content: contentController.text,
    );
    utils.updateInspiration(theInspiration);
    inspirationList = await utils.inspirations();
    //print(dogList);
    getData();
  }

  _onPressedAdd() async {
    final theInspiration = Inspiration(
      //id: int.parse(idController.text),
      title: titleController.text,
      content: contentController.text,
    );
    utils.insertInspiration(theInspiration);
    inspirationList = await utils.inspirations();
    //print(dogList);
    getData();
  }

  _deleteInspirationTable() {
    utils.deleteTable();
    inspirationList = [];
    getData();
  }

  void getData() async {
    await utils.inspirations().then((result) => {
      setState(() {
        inspirationList = result;
      })
    });
    print(inspirationList);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("inspiration screen",
            style: TextStyle(
                fontSize: 18, color: color2, fontWeight: FontWeight.bold)),
          backgroundColor: color1,),
        body: SingleChildScrollView(
          child: Column(
            children: [
              /*Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: idController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter ID'
                  ),
                ),
              ),*/
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter Title'
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: contentController,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter Content'
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: color1),
                        onPressed: _onPressedAdd, child: const Text("Insert Inspiration",
                      style: TextStyle(
                        color: color2,
                      ),
                    ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: color1),
                      onPressed: _onPressedUpdate, child: const Text("Update Inspiration",
                      style: TextStyle(
                        color: color2,
                      ),
                    ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: color1),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ListofInspirations()),
                          );
                        },
                        child: const Text("List Inspirations",
                          style: TextStyle(
                            color: color2,
                          ),
                        ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: color1),
                        onPressed: _deleteInspirationTable,
                        child: const Text("Delete Table",
                          style: TextStyle(
                            color: color2,
                          ),
                        ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: color1),
                      onPressed: () {
                        getData();
                      },
                      child: const Text("Refresh List",
                        style: TextStyle(
                          color: color2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              //Text(inspirationList.length.toString() + " inspirations listed",TextStyle(color: color1,),),
              SingleChildScrollView(
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
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }
}