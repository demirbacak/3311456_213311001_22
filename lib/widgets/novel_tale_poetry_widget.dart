import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../models/novel_tale_poetry_model.dart';
import '../screens/message_screen/message_screen.dart';

class NovelTalePoetryWidget extends StatelessWidget {
  // NovelTalePoetryWidget({Key? key}) : super(key: key, required this.model,);

  NovelTalePoetryModel model;
  Function addOrRemoveFavourites;

   NovelTalePoetryWidget({super.key,
     required this.model,
     required this.addOrRemoveFavourites,
   });

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Text(
                        model.creation,
                        style: const TextStyle(fontStyle: FontStyle.italic),
                      )),
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
                    onPressed: () {
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
                 /* ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: color1),
                    onPressed: addOrRemoveFavourites(),
                    icon: Icon(
                      model.isFavourite ? CupertinoIcons.heart_fill
                          : CupertinoIcons.heart,
                      color: model.isFavourite ? Colors.red : Colors.white,
                    ),
                    label: const Text(
                      'add favourites',
                      style: TextStyle(color: color2),
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

    /*Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                    model.creation,
                    style: const TextStyle(fontStyle: FontStyle.italic),
                  )),
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
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const AlertDialog(
                      content: Text(
                        "We are gratefull for your kindness",
                        style: (TextStyle(
                          fontStyle: FontStyle.italic,
                        )),
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: color1),
                child: const Text(
                  "donate to see all",
                  style: TextStyle(
                    color: color2,
                  ),
                ),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: color1),
                onPressed: addOrRemoveFavourites(),
                icon: Icon(
                    model.isFavourite ? CupertinoIcons.heart_fill
                        : CupertinoIcons.heart,
                  color: model.isFavourite ? Colors.red : Colors.white,
                ),
                label: const Text(
                  'add favourites',
                  style: TextStyle(color: color2),
                ),
              ),
            ],
          ),
        ],
      ),
    );*/
  }
}
