import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../widgets/my_widgets.dart';
import '../main_page_navigated/categories.dart';
import '../main_page_navigated/file_download_view.dart';
import '../main_page_navigated/hall_of_fame.dart';
import '../main_page_navigated/inspirations_screen.dart';
import '../main_page_navigated/suggestions.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: ListView(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildMainPageNavigation(
                  myicon: FontAwesomeIcons.bars,
                  pageName: "categories",
                  mywidget: const Categories(),
                  context: context),
              buildMainPageNavigation(
                  myicon: FontAwesomeIcons.star,
                  pageName: "hall of fame",
                  mywidget: const HallOfFame(),
                  context: context),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildMainPageNavigation(
                  myicon: FontAwesomeIcons.comment,
                  pageName: "suggestions",
                  mywidget: const Suggestions(),
                  context: context),
              buildMainPageNavigation(
                  myicon: FontAwesomeIcons.download,
                  pageName: "download file",
                  mywidget: FileDownloadView(),
                  context: context),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildMainPageNavigation(
                  myicon: FontAwesomeIcons.pen,
                  pageName: "inspirations",
                  mywidget: const InspirationsScreen(),
                  context: context),
            ],
          ),
        ],
      ),
    );
  }
}


/*class MainPage extends StatelessWidget {
   MainPage({Key? key}) : super(key: key);

  String isim = "";

  String soyisim = "";

  @override
  Widget build(BuildContext context) {
    List<dynamic> isimSoyisim = [];
    isimSoyisim = ModalRoute.of(context)?.settings.arguments as List;
    isim = isimSoyisim[0];
    soyisim = isimSoyisim[1];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text("are you talented too",
            style: TextStyle(
                fontSize: 18, color: color2, fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Nice to see you $isim $soyisim!",
                style: const TextStyle(
                  color: color2,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildMainPageNavigation(
                  myicon: FontAwesomeIcons.bars,
                  pageName: "categories",
                  mywidget: const categories(),
                  context: context),
              buildMainPageNavigation(
                  myicon: FontAwesomeIcons.heart,
                  pageName: "favourites",
                  mywidget: const Favourites(),
                  context: context),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildMainPageNavigation(
                  myicon: FontAwesomeIcons.star,
                  pageName: "hall of fame",
                  mywidget: const HallOfFame(),
                  context: context),
              buildMainPageNavigation(
                  myicon: FontAwesomeIcons.comment,
                  pageName: "suggestions",
                  mywidget: const Suggestios(),
                  context: context),
            ],
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