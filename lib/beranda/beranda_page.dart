import 'package:flutter/material.dart';
import 'package:tralalelo_pra_ukk/beranda/widgets/beranda_app_bar.dart';
import 'package:tralalelo_pra_ukk/beranda/widgets/beranda_body.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: BerandaAppBar(), body: const BerandaBody());
  }
}
