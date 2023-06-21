import 'package:flutter/cupertino.dart';
import '../models/caricature_painting_model.dart';


class CaricaturePaintingRiverpod extends ChangeNotifier{
  late List<CaricaturePaintingModel> caricatureList = <CaricaturePaintingModel>[caricature1];
  late List<CaricaturePaintingModel> paintingList = <CaricaturePaintingModel>[painting1,painting2,painting3,painting4,painting5];
  List<CaricaturePaintingModel> visualFavourites = [];

  CaricaturePaintingModel caricature1 = CaricaturePaintingModel(creation: "assets/images/caricature1.png",  artistName: "Jack Paris",);
  CaricaturePaintingModel painting1 = CaricaturePaintingModel(creation: "assets/images/painting1.png",  artistName: "Eliza Darcy",);
  CaricaturePaintingModel painting2 = CaricaturePaintingModel(creation: "assets/images/painting2.png",  artistName: "Eliza Darcy",);
  CaricaturePaintingModel painting3 = CaricaturePaintingModel(creation: "assets/images/painting3.png",  artistName: "Eliza Darcy",);
  CaricaturePaintingModel painting4 = CaricaturePaintingModel(creation: "assets/images/painting4.png",  artistName: "Eliza Darcy",);
  CaricaturePaintingModel painting5 = CaricaturePaintingModel(creation: "assets/images/painting5.png",  artistName: "Eliza Darcy",);

  void addOrRemoveFavourites(CaricaturePaintingModel model) {
    if (model.isFavourite) {
      model.isFavourite = false;
      visualFavourites.remove(model);
      notifyListeners();
    } else {
      model.isFavourite = true;
      visualFavourites.add(model);
      notifyListeners();
    }
  }
}