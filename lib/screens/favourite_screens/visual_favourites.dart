import 'package:are_you_talented_too_2/screens/favourite_screens/visual_favourites_graphic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../main.dart';
import '../../riverpod/riverpod_management.dart';
import '../../widgets/caricature_painting_widget.dart';

class VisualFavourites extends ConsumerWidget {
  const VisualFavourites({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var watch = ref.watch(caricaturePaintingRiverpod);
    var read = ref.read(caricaturePaintingRiverpod);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: GestureDetector(
          onDoubleTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const VisualFavouritesGraphic()));
          },
          child: const Text("visual favourites",
              style: TextStyle(
                  fontSize: 18, color: color2, fontWeight: FontWeight.bold)),
        ),
      ),
      body:  ListView.builder(
        itemCount: read.visualFavourites.length,
        itemBuilder: (BuildContext context, int index) {

          return CaricaturePaintingWidget(
            model: watch.visualFavourites[index],
            addOrRemoveFavourites: () => read.addOrRemoveFavourites(watch.visualFavourites[index]),
          );

        },

      ),


    );
  }
}