import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../main.dart';
import '../../riverpod/riverpod_management.dart';
import '../../widgets/caricature_painting_widget.dart';


class Caricature extends ConsumerWidget {
  const Caricature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(caricaturePaintingRiverpod);
    var read = ref.read(caricaturePaintingRiverpod);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text("caricature",
            style: TextStyle(
                fontSize: 18, color: color2, fontWeight: FontWeight.bold)),
      ),
      body: ListView.builder(
        itemCount: read.caricatureList.length,
        itemBuilder: (BuildContext context, int index) {
          return CaricaturePaintingWidget(
            model: watch.caricatureList[index],
            addOrRemoveFavourites: () =>
                read.addOrRemoveFavourites(watch.caricatureList[index]),
          );
        },
      ),
    );
  }
}




/*class Caricature extends StatelessWidget {
  const Caricature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text("caricature",
            style: TextStyle(
                fontSize: 18, color: color2, fontWeight: FontWeight.bold)),
      ),

      body:ListView(
        children: [
          buildPaintingCaricature(myImage: Image.asset("assets/images/caricature1.png",fit: BoxFit.fill,),  artistName: "Jack Paris", context: context)
        ],
      ) ,

    );
  }
}
*/
/*
class Caricature extends StatelessWidget {
  const Caricature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text("caricature",
            style: TextStyle(
                fontSize: 18, color: color2, fontWeight: FontWeight.bold)),
      ),

      body:ListView(
        children: [
          buildPaintingCaricature(myImage: Image.asset("assets/images/caricature1.png",fit: BoxFit.fill,),  artistName: "Jack Paris", context: context)
        ],
      ) ,

      persistentFooterButtons: [
        buildFooterButtons(context),
      ],
    );
  }
}

 */