import 'package:flutter/material.dart';
import 'package:leadsdoit/view/util/assets.dart';
import 'package:leadsdoit/view/util/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leadsdoit/view/widget/custom_game_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.codGray,
      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: Palette.mineShaft,
        title: Padding(
          padding: const EdgeInsets.only(top: 48),
          child: SvgPicture.asset(Assets.mainLogo, height: 47, width: 47),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.only(top: 24),
        child: CGameCard(),
      ),
    );
  }
}
