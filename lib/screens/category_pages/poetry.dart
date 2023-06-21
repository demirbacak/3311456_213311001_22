import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../main.dart';
import '../../widgets/novel_tale_poetry_widget.dart';
import '../../riverpod/riverpod_management.dart';

class Poetry extends ConsumerWidget {
  const Poetry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var watch = ref.watch(novelTalePoetryRiverpod);
    var read = ref.read(novelTalePoetryRiverpod);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text("poetry",
            style: TextStyle(
                fontSize: 18, color: color2, fontWeight: FontWeight.bold)),
      ),

      body:ListView.builder(
        itemCount: read.poetryList.length,
        itemBuilder: (BuildContext context, int index) {
          return NovelTalePoetryWidget(
            model: watch.poetryList[index],
            addOrRemoveFavourites: () =>
                read.addOrRemoveFavourites(watch.poetryList[index]),
          );
        },
      ),

    );
  }
}

/*
class Poetry extends StatelessWidget {
  const Poetry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text("poetry",
            style: TextStyle(
                fontSize: 18, color: color2, fontWeight: FontWeight.bold)),
      ),

      body:ListView(
        children: [
          buildNovelTalePoetry(beginnig: "    To My Boss\nWhat's the matter with you\nI have got a headache\nWhats the matter with you\n I have got stomach ache\n...", artistName: "Harry Poet", context: context),
          buildNovelTalePoetry(beginnig: "      Answer\nIs it yes\nIs İt no\nSay to me\nWhat is your answer\n...", artistName: "William Romeo", context: context ),
          buildNovelTalePoetry(beginnig: "      Spring\nBirds are singing\nFlowers everywhere\n...", artistName: "Elizabeth Queen", context: context ),
        ],
      ) ,


      persistentFooterButtons: [
        buildFooterButtons(context),
      ],
    );
  }
}
 */
