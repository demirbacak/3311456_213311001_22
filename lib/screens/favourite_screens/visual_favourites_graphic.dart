import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../main.dart';
import '../../riverpod/riverpod_management.dart';

class VisualFavouritesGraphic extends ConsumerStatefulWidget {
  const VisualFavouritesGraphic({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => VisualFavouritesGraphicState();
}

class VisualFavouritesGraphicState extends ConsumerState {

  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {

    var watch = ref.watch(caricaturePaintingRiverpod);
    var read = ref.read(caricaturePaintingRiverpod);

    double liked = read.visualFavourites.length.toDouble();
    double unliked = read.caricatureList.length + read.paintingList.length - liked;
    double total= liked+unliked;
    double percentageOfLiked = liked/total*100;
    double percentageOfUnliked = unliked/total*100;

    List<PieChartSectionData> showingSections() {
      return List.generate(2, (i) {
        final isTouched = i == touchedIndex;
        final fontSize = isTouched ? 25.0 : 16.0;
        final radius = isTouched ? 60.0 : 50.0;
        const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
        switch (i) {
          case 0:
            return PieChartSectionData(
              color: Colors.blue,
              value: liked,
              title: '%$percentageOfLiked',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: shadows,
              ),
            );
          case 1:
            return PieChartSectionData(
              color: Colors.deepOrangeAccent,
              value: unliked,
              title: '%$percentageOfUnliked',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: shadows,
              ),
            );
          default:
            throw Error();
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text("visual favourites graffic",
            style: TextStyle(
                fontSize: 18, color: color2, fontWeight: FontWeight.bold)),
      ),
      body: AspectRatio(
        aspectRatio: 1.3,
        child: Row(
          children: <Widget>[
            const SizedBox(
              height: 18,
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        });
                      },
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 40,
                    sections: showingSections(),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: const [
                    Icon(FontAwesomeIcons.thumbsUp),
                    Text("Liked",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 22,
                    ),)
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: const [
                    Icon(FontAwesomeIcons.thumbsDown),
                    Text("Unliked",
                      style: TextStyle(
                          color: Colors.deepOrangeAccent,
                        fontSize: 22,
                      ),)
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
              ],
            ),
            const SizedBox(
              width: 28,
            ),
          ],
        ),
      ),
    );
  }


}