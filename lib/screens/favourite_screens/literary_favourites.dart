import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../main.dart';
import '../../riverpod/riverpod_management.dart';
import '../../widgets/novel_tale_poetry_widget.dart';
import 'literary_favourites_graphic.dart';

class LiteraryFavourites extends ConsumerWidget {
  const LiteraryFavourites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var watch = ref.watch(novelTalePoetryRiverpod);
    var read = ref.read(novelTalePoetryRiverpod);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: GestureDetector(
          onDoubleTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LiteraryFavouritesGraphic()));
          },
          child: const Text("literary favourites",
              style: TextStyle(
                  fontSize: 18, color: color2, fontWeight: FontWeight.bold)),
        ),
      ),
      body:  ListView.builder(
        itemCount: read.literaryFavourites.length,
        itemBuilder: (BuildContext context, int index) {

          return NovelTalePoetryWidget(
            model: watch.literaryFavourites[index],
            addOrRemoveFavourites: () => read.addOrRemoveFavourites(watch.literaryFavourites[index]),
          );

        },

      ),


    );
  }
}