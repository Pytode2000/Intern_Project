import 'package:flutter/material.dart';

class TheBigPlaceScreen extends StatefulWidget {
  static const routeName = "/the-big-place";

  @override
  _TheBigPlaceScreenState createState() => _TheBigPlaceScreenState();
}

class _TheBigPlaceScreenState extends State<TheBigPlaceScreen> {
  int selected = 0;

  Widget middleContent() {
    if (selected == 0) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.60,
      );
    } else {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.60,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.1666,
                  color: Colors.red,
                  height: MediaQuery.of(context).size.height * 0.10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.1666,
                  color: Colors.orange,
                  height: MediaQuery.of(context).size.height * 0.10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.1666,
                  color: Colors.yellow,
                  height: MediaQuery.of(context).size.height * 0.10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.1666,
                  color: Colors.green,
                  height: MediaQuery.of(context).size.height * 0.10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.1666,
                  color: Colors.blue,
                  height: MediaQuery.of(context).size.height * 0.10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.1666,
                  color: Colors.purple,
                  height: MediaQuery.of(context).size.height * 0.10,
                ),
              ],
            )
          ],
        ),
      );
    }
  }

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "The Big Place",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // Show sheet here
                showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return new Container(
                        height: MediaQuery.of(context).size.height * 0.40,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("Test"),
                                Switch(value: false, onChanged: (value) {})
                              ],
                            )
                          ],
                        ),
                      );
                    });
              }),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              "assets/images/the_big_place.png",
            ),
          ),
        ),
        child: Column(
          children: [
            Container(
              color: selected == 0
                  ? Color(0xB3000000)
                  : Color(
                      (0xB3007C89),
                    ),
              height: MediaQuery.of(context).size.height * 0.15,
              child: Center(
                child: Text(
                  selected == 0 ? "Select a Layout" : "Drag Source to Screen",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 42,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // Widget
            middleContent(),

            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => setState(() {
                        selected = 1;
                      }),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.3333,
                        // color: Colors.yellow,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image:
                                AssetImage("assets/images/the_big_place.png"),
                          ),
                        ),
                        child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: double.infinity,
                            color: selected == 1
                                ? Color(0xB3007C89)
                                : Color(
                                    (0xB3000000),
                                  ),
                            child: Center(
                              child: Text(
                                "Layout 1",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 36,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => setState(() {
                        selected = 2;
                      }),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.3333,
                        // color: Colors.yellow,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/images/open_place.png"),
                          ),
                        ),
                        child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: double.infinity,
                            color: selected == 2
                                ? Color(0xB3007C89)
                                : Color(
                                    (0xB3000000),
                                  ),
                            child: Center(
                              child: Text(
                                "Layout 2",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 36,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => setState(() {
                        selected = 3;
                      }),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.3333,
                        // color: Colors.yellow,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/images/townhall.png"),
                          ),
                        ),
                        child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: double.infinity,
                            color: selected == 3
                                ? Color(0xB3007C89)
                                : Color(
                                    (0xB3000000),
                                  ),
                            child: Center(
                              child: Text(
                                "Layout 3",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 36,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
