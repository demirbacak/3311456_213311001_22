import 'package:flutter/material.dart';
import '../../main.dart';

class InspirationDetailScreen extends StatelessWidget {
  //const InspirationDetailScreen({Key? key}) : super(key: key);

  //int id;
  final String title;
  final String content;

  const InspirationDetailScreen({super.key,
    //required this.id,
    required this.title,
    required this.content,

});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Inspiration Detail Screen"),
        backgroundColor: color1,),
      body: SingleChildScrollView(
        child: Column(
            children: [
       /* Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(id as String,),
      ),*/
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(title),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(content),
      ),
    ],
        ),
    ),
    );
  }
}
