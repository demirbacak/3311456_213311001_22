import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../favourite_screens/literary_favourites.dart';
import '../../widgets/my_widgets.dart';
import '../favourite_screens/literary_favourites_graphic.dart';
import '../favourite_screens/visual_favourites.dart';
import '../favourite_screens/visual_favourites_graphic.dart';


class Favourites extends StatelessWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
       buildFavouritesNavigation(mywidget: const VisualFavourites(), context: context, pageName: "visual favourites", myIcon: FontAwesomeIcons.heartPulse),
        buildFavouritesNavigation(mywidget: const VisualFavouritesGraphic(), context: context, pageName: "visual favourites graphic", myIcon: FontAwesomeIcons.heartPulse),
        buildFavouritesNavigation(mywidget: const LiteraryFavourites(), context: context, pageName: "literary favourites", myIcon: FontAwesomeIcons.heartCrack),
        buildFavouritesNavigation(mywidget: const LiteraryFavouritesGraphic(), context: context, pageName: "literary favourites graphic", myIcon: FontAwesomeIcons.heartCrack),

      ]),
    );
  }
}




/*class Favourites extends ConsumerWidget {
  const Favourites({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var watch = ref.watch(novelTalePoetryRiverpod);
    var read = ref.read(novelTalePoetryRiverpod);

    return Scaffold(

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
}*/
/*
class Favourites extends StatelessWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text("favourites",
            style: TextStyle(
                fontSize: 18, color: color2, fontWeight: FontWeight.bold)),
      ),
      body: const Text("favourites"),
      persistentFooterButtons: [
        buildFooterButtons(context),
      ],
    );
  }
}*/
