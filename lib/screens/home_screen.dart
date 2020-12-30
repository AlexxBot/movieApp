import 'package:flutter/material.dart';
import 'package:movie_app/widgets/now_playing.dart';
import '../style/colors.dart' as Style;
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.Colors.mainColor,
      appBar: AppBar(
        backgroundColor: Style.Colors.mainColor,
        centerTitle: true,
        leading: Icon(EvaIcons.menu2Outline, color: Colors.white),
        actions: [
          IconButton(
              icon: Icon(EvaIcons.searchOutline, color: Colors.white),
              onPressed: null),
        ],
      ),
      body: ListView(
        children: [
          NowPlaying()
        ],
      )
    );
  }
}
