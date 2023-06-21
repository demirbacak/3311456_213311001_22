import 'package:flutter/material.dart';
import '../../main.dart';

class HallOfFame extends StatefulWidget {
  const HallOfFame({Key? key}) : super(key: key);

  @override
  State<HallOfFame> createState() => _HallOfFameState();
}

class _HallOfFameState extends State<HallOfFame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text("hall of fame",
            style: TextStyle(
                fontSize: 18, color: color2, fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text("They were here too",
                style: TextStyle(
                    fontSize: 18, color: color2, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "The King of England\n\n"
              "Late President Kennedy\n\n"
              "Pele the crownless king\n\n"
              "Backenbauer\n\n"
              "Mayer the goalkeaeer\n\n"
              "Nadia Komanaçi\n\n"
              "Brigitte Bardot\n\n"
              "Fenerbahçeli Cemil\n\n"
              "J. K. ROWLİNG\n\n"
              "Suzanne COLLİNS\n\n"
              "Muriel BARBERY\n\n"
              "Abidin DİNO\n\n"
              "Erdil YAŞAROĞLU\n\n"
              "Selçuk ERDEM\n\n",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: color1,
              ),
            ),
          ),
        ],
      ),

    );
  }
}
/*class HallOfFame extends StatefulWidget {
  const HallOfFame({Key? key}) : super(key: key);

  @override
  State<HallOfFame> createState() => _HallOfFameState();
}

class _HallOfFameState extends State<HallOfFame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text("hall of fame",
            style: TextStyle(
                fontSize: 18, color: color2, fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text("They were here too",
                style: TextStyle(
                    fontSize: 18, color: color2, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "The King of England\n\n"
              "Late President Kennedy\n\n"
              "Pele the crownless king\n\n"
              "Backenbauer\n\n"
              "Mayer the goalkeaeer\n\n"
              "Nadia Komanaçi\n\n"
              "Brigitte Bardot\n\n"
              "Fenerbahçeli Cemil\n\n"
              "J. K. ROWLİNG\n\n"
              "Suzanne COLLİNS\n\n"
              "Muriel BARBERY\n\n"
              "Abidin DİNO\n\n"
              "Erdil YAŞAROĞLU\n\n"
              "Selçuk ERDEM\n\n",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: color1,
              ),
            ),
          ),
        ],
      ),
      persistentFooterButtons: [
        buildFooterButtons(context),
      ],
    );
  }
}

 */
