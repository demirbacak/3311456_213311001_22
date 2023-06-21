import 'package:flutter/material.dart';
import '../../main.dart';
import '../../services/file_utils.dart';

class FileOperationsScreen extends StatefulWidget {
  const FileOperationsScreen({super.key});

  final String title = "File Operations";

  @override
  _FileOperationsScreenState createState() => _FileOperationsScreenState();
}

class _FileOperationsScreenState extends State<FileOperationsScreen> {
  String fileContents = "No data";
  final fl_profile = TextEditingController();
 // final fl_email = TextEditingController();
 // final fl_password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text("file operations",
            style: TextStyle(
                fontSize: 18, color: color2, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Name, e-mail and password: ",
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: fl_profile,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: color1),
            child: const Text("Save to File",
              style: (TextStyle(
                color: color2,
              )),
            ),
            onPressed: () {
              FileUtils.saveToFile(fl_profile.text);
              //FileUtils.saveToFile(fl_email.text);
              //FileUtils.saveToFile(fl_password.text);

            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: color1),
            child: const Text("Read From File",
              style: (TextStyle(
                color: color2,
              )),),
            onPressed: () {
              FileUtils.readFromFile().then((contents) {
                setState(() {
                  fileContents = contents;
                });
              });
            },
          ),
          Text(fileContents),
        ],
      ),
    );
  }
}