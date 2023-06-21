import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import '../../main.dart';

class FileDownloadView extends StatefulWidget {
  const FileDownloadView({super.key});

  @override
  _FileDownloadViewState createState() => _FileDownloadViewState();
}

class _FileDownloadViewState extends State<FileDownloadView> {
  String _filePath = "";

  Future<String> get _localDevicePath async {
    final _devicePath = await getApplicationDocumentsDirectory();
    return _devicePath.path;
  }

  Future<File> _localFile({required String path, required String type}) async {
    String _path = await _localDevicePath;

    var _newPath = await Directory("$_path/$path").create();
    return File("${_newPath.path}/poetry.$type");
  }

  Future _downloadSamplePDF() async {
    final _response = await http.get(Uri.parse(
        "https://img.antoloji.com/i/sair/pdf/9/avn%C3%AE_fatih_sultan_mehmet__7159_80786.pdf"));
    if (_response.statusCode == 200) {
      final _file = await _localFile(path: "pdfs", type: "pdf");
      final _saveFile = await _file.writeAsBytes(_response.bodyBytes);
      print("Done. File path: ${_saveFile.path}");
      setState(() {
        _filePath = _saveFile.path;
      });
    } else {
      print(_response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text("download pdf",
            style: TextStyle(
                fontSize: 18, color: color2, fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton.icon(
              icon: const Icon(FontAwesomeIcons.download,
              color: color1,),
              label: const Text("Download Pdf",
                style: TextStyle(
                  color: color1,
                ),),
              onPressed: () {
                _downloadSamplePDF();
              },
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_filePath),
            ),
            TextButton.icon(
              icon: const Icon(FontAwesomeIcons.tv,
              color: color1,),
              label: const Text("View the downloaded file",
                style: TextStyle(
                  color: color1,
                ),),
              onPressed: () async {
                final _openFile = await OpenFilex.open(_filePath);
                print(_openFile);
              },
            ),
          ],
        ),
      ),
    );
  }
}