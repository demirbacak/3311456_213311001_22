import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../main.dart';
import '../../widgets/novel_tale_poetry_widget.dart';
import '../../riverpod/riverpod_management.dart';

class Novel extends ConsumerWidget {
  const Novel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(novelTalePoetryRiverpod);
    var read = ref.read(novelTalePoetryRiverpod);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text("novel",
            style: TextStyle(
                fontSize: 18, color: color2, fontWeight: FontWeight.bold)),
      ),
      body: ListView.builder(
        itemCount: read.novelList.length,
        itemBuilder: (BuildContext context, int index) {
          return NovelTalePoetryWidget(
            model: watch.novelList[index],
            addOrRemoveFavourites: () =>
                read.addOrRemoveFavourites(watch.novelList[index]),
          );
        },
      ),
    );
  }
}

/*
class Novel extends StatelessWidget {
  const Novel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text("novel",
            style: TextStyle(
                fontSize: 18, color: color2, fontWeight: FontWeight.bold)),
      ),

      body:ListView(
        children: [
          buildNovelTalePoetry(beginnig: "    Mrs Cole's biggest dream was too see her three daughters in rich marriages...", artistName: "Jane Augusten", context: context),

        ],
      ) ,

      persistentFooterButtons: [
               buildFooterButtons(context),
      ],
    );
  }
}
 */
