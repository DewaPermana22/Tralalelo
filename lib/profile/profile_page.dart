import 'package:flutter/material.dart';
import 'package:tralalelo_pra_ukk/profile/widgets/profile_app_bar.dart';
import 'package:tralalelo_pra_ukk/profile/widgets/profile_header.dart';
import 'package:tralalelo_pra_ukk/profile/widgets/profile_menu_section.dart';
import 'package:tralalelo_pra_ukk/profile/widgets/logout_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ProfileAppBar(),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            ProfileHeader(),
            SizedBox(height: 30),
            ProfileMenuSection(),
            SizedBox(height: 30),
            LogoutButton(),
          ],
        ),
      ),
    );
  }
}
