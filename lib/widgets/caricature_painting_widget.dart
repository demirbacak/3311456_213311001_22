import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../models/caricature_painting_model.dart';
import '../screens/message_screen/message_screen.dart';

class CaricaturePaintingWidget extends StatelessWidget {
  // NovelTalePoetryWidget({Key? key}) : super(key: key, required this.model,);

  CaricaturePaintingModel model;
  Function addOrRemoveFavourites;

  CaricaturePaintingWidget({
    super.key,
    required this.model,
    required this.addOrRemoveFavourites,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40),
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: Container(
                      height: 200,
                      width: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.6),
                            )
                          ]),
                      child: Image(image:AssetImage(model.creation),
                    ),
                  ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    model.artistName,
                    style: const TextStyle(
                      color: color2,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed:  () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MessageScreen()));
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: color1),
                    child: const Text(
                      "send a message",
                      style: TextStyle(
                        color: color2,
                      ),
                    ),
                  ),
                  /*ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: color1),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const AlertDialog(
                          content: Text(
                            "Added to favourites",
                            style: (TextStyle(
                              fontStyle: FontStyle.italic,
                            )),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(FontAwesomeIcons.heart),
                    label: const Text(
                      'add favourites',
                      style: TextStyle(
                        color: color2,
                      ),
                    ),
                  ),*/
                ],
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () => addOrRemoveFavourites(),
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade300, width: 0.5),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Icon(
                  model.isFavourite
                      ? CupertinoIcons.heart_fill
                      : CupertinoIcons.heart,
                  color: model.isFavourite ? Colors.red : Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
