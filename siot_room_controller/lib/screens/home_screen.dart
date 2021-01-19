import 'package:flutter/material.dart';

import '../widgets/home_room.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  final ScrollController _controllerOne = ScrollController();
  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        // barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ALERT'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  // Text('Alert'),
                  Text('Are you sure you want to shut down everything?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('No'),
                onPressed: () {
                  // Navigator.of(context).pushNamed("/");
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: Text('Yes'),
                onPressed: () {
                  Navigator.of(context).pushNamed("/");
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.power_settings_new,
            color: Colors.white,
          ),
          // onPressed: () => Navigator.of(context).pop(),
          onPressed: () => _showMyDialog(),
        ),
        title: Text(
          "Control Room",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Scrollbar(
              isAlwaysShown: true,
              controller: _controllerOne,
              child: ListView(
                scrollDirection: Axis.horizontal,
                controller: _controllerOne,
                children: <Widget>[
                  HomeRoom("assets/images/the_big_place.png", "The Big Place",
                      "/the-big-place"),
                  HomeRoom("assets/images/open_place.png", "Open Place",
                      "/open-place"),
                  HomeRoom("assets/images/townhall.png", "Townhall",
                      "/townhall"),
                ],
              ),
            ),
          ),
          Align(
            alignment: FractionalOffset.centerRight,
            child: Icon(
              Icons.double_arrow_sharp,
              color: Colors.blueGrey,
              size: 100.0,
            ),
          )
        ],
      ),
    );
  }
}
