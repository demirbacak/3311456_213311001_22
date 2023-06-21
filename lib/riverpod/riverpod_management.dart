import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'bottom_navbar_riverpod.dart';
import 'caricature_painting_riverpod.dart';
import 'novel_tale_poetry_riverpod.dart';

final bottomNavBarRiverpod = ChangeNotifierProvider((_) => BottomNavBarRiverpod());
final novelTalePoetryRiverpod = ChangeNotifierProvider((_) => NovelTalePoetryRiverpod());
final caricaturePaintingRiverpod = ChangeNotifierProvider((_) => CaricaturePaintingRiverpod());
