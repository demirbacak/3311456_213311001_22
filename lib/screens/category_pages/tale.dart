import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../main.dart';
import '../../riverpod/riverpod_management.dart';
import '../../widgets/novel_tale_poetry_widget.dart';

class Tale extends ConsumerWidget {
  const Tale({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var watch = ref.watch(novelTalePoetryRiverpod);
    var read = ref.read(novelTalePoetryRiverpod);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text("tale",
            style: TextStyle(
                fontSize: 18, color: color2, fontWeight: FontWeight.bold)),
      ),
      body: ListView.builder(
        itemCount: read.taleList.length,
        itemBuilder: (BuildContext context, int index) {
          return NovelTalePoetryWidget(
            model: watch.taleList[index],
            addOrRemoveFavourites: () =>
                read.addOrRemoveFavourites(watch.taleList[index]),
          );
        },
      ),

    );
  }
}

/*
class Tale extends StatelessWidget {
  const Tale({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text("tale",
            style: TextStyle(
                fontSize: 18, color: color2, fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        children: [
          buildNovelTalePoetry(
              beginnig:
                  "    Long long time ago on a far away land. There was an old king loved by his people but hasn't any child. He decided to find some one to rule after him...",
              artistName: "Christopher Tallking",
              context: context),
        ],
      ),
      persistentFooterButtons: [
        buildFooterButtons(context),
      ],
    );
  }
}
 */
