import 'package:flutter/cupertino.dart';
import '../models/novel_tale_poetry_model.dart';

class NovelTalePoetryRiverpod extends ChangeNotifier{
  late List<NovelTalePoetryModel> novelList = <NovelTalePoetryModel>[novel1];
  late List<NovelTalePoetryModel> taleList = <NovelTalePoetryModel>[tale1];
  late List<NovelTalePoetryModel> poetryList = <NovelTalePoetryModel>[poet1, poet2, poet3];
  List<NovelTalePoetryModel> literaryFavourites = [];

  NovelTalePoetryModel novel1 = NovelTalePoetryModel(creation: "    Mrs Cole's biggest dream was too see her three daughters in rich marriages...", artistName: "Jane Augusten",);
  NovelTalePoetryModel novel2 = NovelTalePoetryModel(creation: "    Mr Brown woke up as usual. He brushed his teeth, dressed and went out... ", artistName: "Joseph Fisherman",);
  NovelTalePoetryModel tale1 = NovelTalePoetryModel(creation: "    Long long time ago on a far away land. There was an old king loved by his people but hasn't any child. He decided to find some one to rule after him...", artistName: "Christopher Tallking");
  NovelTalePoetryModel poet1 = NovelTalePoetryModel(creation:"    To My Boss\nWhat's the matter with you\nI have got a headache\nWhats the matter with you\n I have got stomach ache\n...", artistName: "Harry Poet",);
  NovelTalePoetryModel poet2 = NovelTalePoetryModel(creation:"      Answer\nIs it yes\nIs İt no\nSay to me\nWhat is your answer\n...", artistName: "William Romeo",);
  NovelTalePoetryModel poet3 = NovelTalePoetryModel(creation:"      Spring\nBirds are singing\nFlowers everywhere\n...", artistName: "Elizabeth Queen",);
  NovelTalePoetryModel poet = NovelTalePoetryModel(creation:"      The Weather\nIt's rainy today\nMaybe sunny tomorrow\n...", artistName: "Elizabeth Queen",);


  void addOrRemoveFavourites(NovelTalePoetryModel model) { /* noveltalepoetry yerine dynemic dene*/
    if (model.isFavourite) {
      model.isFavourite = false;
      literaryFavourites.remove(model);
      notifyListeners();
    } else {
      model.isFavourite = true;
      literaryFavourites.add(model);
      notifyListeners();
    }
  }
}