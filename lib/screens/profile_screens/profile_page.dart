import 'package:are_you_talented_too_2/screens/profile_screens/update_profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../widgets/my_widgets.dart';
import '../footer_navigated/user_profile.dart';
import 'file_operations.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        buildProfilePage(
            myicon: FontAwesomeIcons.user,
            profilePageName: "user profile",
            mywidget: const UserProfile(),
            context: context),
        buildProfilePage(
            myicon: FontAwesomeIcons.u,
            profilePageName: "update profile",
            mywidget: const UpdateProfile(),
            context: context),
        buildProfilePage(
            myicon: FontAwesomeIcons.file,
            profilePageName: "file operations",
            mywidget: const FileOperationsScreen(),
            context: context),

      ]),
    );
  }
}