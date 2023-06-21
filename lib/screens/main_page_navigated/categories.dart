import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../main.dart';
import '../../widgets/my_widgets.dart';
import '../category_pages/caricature.dart';
import '../category_pages/novel.dart';
import '../category_pages/painting.dart';
import '../category_pages/poetry.dart';
import '../category_pages/tale.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text("categories",
            style: TextStyle(
                fontSize: 18, color: color2, fontWeight: FontWeight.bold)),
      ),
      body: ListView(children: [
        buildCategory(
            myicon: FontAwesomeIcons.feather,
            categoryName: "poetry",
            mywidget: const Poetry(),
            context: context),
        buildCategory(
            myicon: FontAwesomeIcons.palette,
            categoryName: "painting",
            mywidget: const Painting(),
            context: context),
        buildCategory(
            myicon: FontAwesomeIcons.pencil,
            categoryName: "caricature",
            mywidget: const Caricature(),
            context: context),
        buildCategory(
            myicon: FontAwesomeIcons.book,
            categoryName: "novel",
            mywidget: const Novel(),
            context: context),
        buildCategory(
            myicon: FontAwesomeIcons.scroll,
            categoryName: "tale",
            mywidget: const Tale(),
            context: context),
      ]),
    );
  }
}

/*lass Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text("categories",
            style: TextStyle(
                fontSize: 18, color: color2, fontWeight: FontWeight.bold)),
      ),
      body: ListView(children: [
        buildCategory(
            myicon: FontAwesomeIcons.feather,
            categoryName: "poetry",
            mywidget: const Poetry(),
            context: context),
        buildCategory(
            myicon: FontAwesomeIcons.palette,
            categoryName: "painting",
            mywidget: const Painting(),
            context: context),
        buildCategory(
            myicon: FontAwesomeIcons.pencil,
            categoryName: "caricature",
            mywidget: const Caricature(),
            context: context),
        buildCategory(
            myicon: FontAwesomeIcons.book,
            categoryName: "novel",
            mywidget: const Novel(),
            context: context),
        buildCategory(
            myicon: FontAwesomeIcons.scroll,
            categoryName: "tale",
            mywidget: const Tale(),
            context: context),
      ]),
      persistentFooterButtons: [
        buildFooterButtons(context),
      ],
    );
  }
}
 */
