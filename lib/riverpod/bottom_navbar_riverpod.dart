import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../main.dart';
import '../screens/footer_navigated/main_page.dart';
import '../screens/footer_navigated/favourites.dart';
import '../screens/profile_screens/profile_page.dart';

class BottomNavBarRiverpod extends ChangeNotifier {
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.heart, color: color1,), label: "Favourites"),
    const BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.house, color: color1,), label: "Main Page"),
    const BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.user, color: color1,), label: "Profile"),

  ];
  int currentIndex = 1;

  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  String appbarTitle() {
    switch (currentIndex) {
      case 0:
        return "favourites";
      case 1:
        return "main Page";
      case 2:
        return "profile Pages";
      default:
        return "main Page";
    }
  }

  Widget body() {
    switch (currentIndex) {
      case 0:
        return const Favourites();
      case 1:
        return MainPage();
      case 2:
        return const ProfilePage();
      default:
        return MainPage();
    }
  }
}