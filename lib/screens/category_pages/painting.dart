import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../widgets/caricature_painting_widget.dart';
import '../../main.dart';
import '../../riverpod/riverpod_management.dart';

class Painting extends ConsumerWidget {
  const Painting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(caricaturePaintingRiverpod);
    var read = ref.read(caricaturePaintingRiverpod);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text("painting",
            style: TextStyle(
                fontSize: 18, color: color2, fontWeight: FontWeight.bold)),
      ),
      body: ListView.builder(
        itemCount: read.paintingList.length,
        itemBuilder: (BuildContext context, int index) {
          return CaricaturePaintingWidget(
            model: watch.paintingList[index],
            addOrRemoveFavourites: () =>
                read.addOrRemoveFavourites(watch.paintingList[index]),
          );
        },
      ),
    );
  }
}




/*
class Painting extends StatelessWidget {
  const Painting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text("painting",
            style: TextStyle(
                fontSize: 18, color: color2, fontWeight: FontWeight.bold)),
      ),

      body:ListView(
        children: [
          buildPaintingCaricature(myImage: Image.asset("assets/images/painting1.png",fit: BoxFit.fill,),  artistName: "Jack Paris", context: context)

        ],
      ) ,

    );
  }
}
*/
/*
class Painting extends StatelessWidget {
  const Painting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text("painting",
            style: TextStyle(
                fontSize: 18, color: color2, fontWeight: FontWeight.bold)),
      ),

      body:ListView(
        children: [
          buildPaintingCaricature(myImage: Image.asset("assets/images/painting1.png",fit: BoxFit.fill,),  artistName: "Jack Paris", context: context)

        ],
      ) ,

      persistentFooterButtons: [
        buildFooterButtons(context),
      ],
    );
  }
}
 */