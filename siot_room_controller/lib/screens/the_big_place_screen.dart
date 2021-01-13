import 'package:flutter/material.dart';
import '../widgets/draggable_widget.dart';
import 'package:blinking_text/blinking_text.dart';

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

  String testing = "test";
  String droppedSource = "";

  void refresh() {
    setState(() {});
  }

  Widget buildDragTarget() {
    return DragTarget(
      builder: (BuildContext bc, List<String> incoming, List rejected) {
        // if (data == "Test") {
        //   return Container(
        //     child: Text("Test1"),
        //   );
        // } else {
        //   return Container(
        //     child: Text("Test2"),
        //   );
        // }
        if (droppedSource == "") {
          return Container(
            child: projectorOne == false
                ? Text(
                    "Projector 1 is switched off",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  )
                : Text(
                    "Select a Source",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
          );
        } else if (droppedSource == "off") {
          return Container(
            child: BlinkText(
              "Projector 1 is switched off",
              style: TextStyle(
                fontSize: 24,
              ),
              beginColor: Colors.black,
              endColor: Colors.red,
              times: 2,
              duration: Duration(milliseconds: 1000),
            ),
          );
        } else {
          return Container(
            child: Text("Testing2"),
            height: 50,
            color: Colors.red,
          );
        }
      },
      onWillAccept: (data) => true,
      onAccept: (data) {
        if (projectorOne == false) {
          setState(() {
            droppedSource = "off";
            print("Projector off");
          });
        } else {
          if (data == "test") {
            setState(() {
              droppedSource = "placed";
              print("Updated");
            });
          } else {
            droppedSource = "wrong";
            // print("no Updated");
            print("$droppedSource LOL");
          }
        }
      },
    );
  }

  Widget middleContent() {
    if (selectedLayout == 0) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.60,
      );
    } else {
      return Container(
        height: MediaQuery.of(context).size.height * 0.60,
        // margin: EdgeInsets.only(
        //   top: MediaQuery.of(context).size.height * 0.01,
        //   bottom: MediaQuery.of(context).size.height * 0.01,
        // ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  child: Draggable<String>(
                    data: "test",
                    child: DraggableWidget(0x80000000),
                    feedback: DraggableWidget(0x80007C89),
                    childWhenDragging: DraggableWidget(0x80000000),
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.025,
                bottom: MediaQuery.of(context).size.height * 0.025,
              ),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3333,
                    color: Color(0xE6D9D9D9),
                    child: Center(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.35,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: buildDragTarget(),
                                ),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                alignment: Alignment.center,
                                child: Text(
                                  "Screen 1",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 32,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: Icon(
                              Icons.volume_off,
                              size: 75,
                              // color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
          // Settings
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return StatefulBuilder(builder:
                          (BuildContext context, StateSetter setState) {
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
                                    refresh();
                                    droppedSource = "";
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
                                    refresh();
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
                                    refresh();
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
              // Heading
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
            middleContent(), // TO BE CONT.
            Expanded(
              // Bottom Tab
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
