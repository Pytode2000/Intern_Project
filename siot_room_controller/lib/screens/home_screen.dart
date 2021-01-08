import 'package:flutter/material.dart';
import 'package:blinking_text/blinking_text.dart';

import '../widgets/home_room.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  final ScrollController _controllerOne = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.power_settings_new,
            color: Colors.white,
            size: 40,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Control Room",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Scrollbar(
          isAlwaysShown: true,
          controller: _controllerOne,
          child: ListView(
            scrollDirection: Axis.horizontal,
            controller: _controllerOne,
            children: <Widget>[
              HomeRoom("assets/images/the_big_place.png", "The Big Place"),
              HomeRoom("assets/images/open_place.png", "Open Place"),
              HomeRoom("assets/images/townhall.png", "Townhall"),
            ],
          ),
        ),
      ),
    );
  }
}
