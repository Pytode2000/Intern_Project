import 'package:flutter/material.dart';

class TheBigPlaceScreen extends StatefulWidget {
  static const routeName = "/the-big-place";

  @override
  _TheBigPlaceScreenState createState() => _TheBigPlaceScreenState();
}

class _TheBigPlaceScreenState extends State<TheBigPlaceScreen> {
  int selectedLayout = 0;
  bool projectorOne = false;
  bool projectorTwo = true;
  bool projectorThree = false;

  Widget middleContent() {
    if (selectedLayout == 0) {
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

  Widget projectorWidget(name, state) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3333,
      color: state == true ? Color(0xB3007C89) : Color(0xB3000000),
      child: Center(
        child: Text(
          "$name",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget layoutWidget(selectedLayoutNumber, imgPathStr) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3333,
      // color: Colors.yellow,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("$imgPathStr"),
        ),
      ),
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.06,
          width: double.infinity,
          color: selectedLayout == selectedLayoutNumber
              ? Color(0xB3007C89)
              : Color(
                  (0xB3000000),
                ),
          child: Center(
            child: Text(
              "Layout $selectedLayoutNumber",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

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
                      return StatefulBuilder(builder: (BuildContext context,
                          StateSetter setState /*You can rename this!*/) {
                        return new Container(
                          height: MediaQuery.of(context).size.height * 0.40,
                          width: double.infinity,
                          // color: Colors.red,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (projectorOne == true) {
                                      projectorOne = false;
                                    } else {
                                      projectorOne = true;
                                    }
                                  });
                                },
                                child: projectorWidget(
                                    "Projector 1", projectorOne),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (projectorTwo == true) {
                                      projectorTwo = false;
                                    } else {
                                      projectorTwo = true;
                                    }
                                  });
                                },
                                child: projectorWidget(
                                    "Projector 2", projectorTwo),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (projectorThree == true) {
                                      projectorThree = false;
                                    } else {
                                      projectorThree = true;
                                    }
                                  });
                                },
                                child: projectorWidget(
                                    "Projector 3", projectorThree),
                              ),
                            ],
                          ),
                        );
                      });
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
              color: selectedLayout == 0
                  ? Color(0xB3000000)
                  : Color(
                      (0xB3007C89),
                    ),
              height: MediaQuery.of(context).size.height * 0.15,
              child: Center(
                child: Text(
                  selectedLayout == 0
                      ? "Select a Layout"
                      : "Drag Source to Screen",
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
                        selectedLayout = 1;
                      }),
                      child: layoutWidget(1, "assets/images/the_big_place.png"),
                    ),
                    GestureDetector(
                      onTap: () => setState(() {
                        selectedLayout = 2;
                      }),
                      child: layoutWidget(2, "assets/images/open_place.png"),
                    ),
                    GestureDetector(
                      onTap: () => setState(() {
                        selectedLayout = 3;
                      }),
                      child: layoutWidget(3, "assets/images/townhall.png"),
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
