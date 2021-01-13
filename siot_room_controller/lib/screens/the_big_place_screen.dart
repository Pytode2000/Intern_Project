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
  String projectorOneSource = "";
  double projectorOneVolume = 50;

  bool projectorTwo = true;
  String projectorTwoSource = "";
  double projectorTwoVolume = 50;

  bool projectorThree = true;
  String projectorThreeSource = "";
  double projectorThreeVolume = 50;

  void refresh() {
    setState(() {});
  }

  Widget buildDragTarget(screen) {
    return DragTarget(
      builder: (BuildContext bc, List<String> incoming, List rejected) {
        String projectorSource;
        String projectorNumber;
        bool projector;

        if (screen == 1) {
          projectorSource = projectorOneSource;
          projectorNumber = "Projector 1";
          projector = projectorOne;
        } else if (screen == 2) {
          projectorSource = projectorTwoSource;
          projectorNumber = "Projector 2";
          projector = projectorTwo;
        } else if (screen == 3) {
          projectorSource = projectorThreeSource;
          projectorNumber = "Projector 3";
          projector = projectorThree;
        }

        if (projectorSource == "") {
          return Container(
            height: MediaQuery.of(context).size.height * 0.40,
            child: Center(
              child: projector == false
                  ? Text(
                      "$projectorNumber is switched off",
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
            ),
          );
        } else if (projectorSource == "off") {
          return Container(
            height: MediaQuery.of(context).size.height * 0.40,
            child: Center(
              child: BlinkText(
                "$projectorNumber is switched off",
                style: TextStyle(
                  fontSize: 24,
                ),
                beginColor: Colors.black,
                endColor: Colors.red,
                times: 2,
                duration: Duration(milliseconds: 500),
              ),
            ),
          );
        } else {
          return Container(
            height: MediaQuery.of(context).size.height * 0.40,
            child: Stack(children: [
              Center(
                child: Icon(
                  Icons.laptop,
                  size: 200,
                  color: Colors.green,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  right: 12,
                  top: 12,
                ),
                child: Align(
                  alignment: FractionalOffset.topRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      size: 40,
                    ),
                    onPressed: () {
                      setState(() {
                        projectorOneSource = "";
                      });
                    },
                  ),
                ),
              ),
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: double.infinity,
                  color: Color(0x80000000),
                  child: Center(
                    child: Text(
                      "HDMI 1",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          );
        }
      },
      onWillAccept: (data) => true,
      onAccept: (data) {
        // TO BE CONT
        if (screen == 1) {
          if (projectorOne == false) {
            setState(() {
              projectorOneSource = "off";
              print("Projector off");
            });
          } else {
            if (data == "test") {
              setState(() {
                projectorOneSource = "placed";
                print("Updated");
              });
            } else {
              projectorOneSource = "wrong";
              // print("no Updated");
              print("$projectorOneSource LOL");
            }
          }
        } else if (screen == 2) {}
      },
    );
  }

  Widget middleContent() {
    double screenSize;
    double screenMargins;
    if (selectedLayout == 1) {
      screenSize = 0.80;
      screenMargins = 0.1;
    } else if (selectedLayout == 2) {
      screenSize = 0.45;
      screenMargins = 0.05;
    } else if (selectedLayout == 3) {
      screenSize = 0.3331;
      screenMargins = 0.025;
    }
    if (selectedLayout == 0) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.60,
      );
    } else {
      return Container(
        height: MediaQuery.of(context).size.height * 0.60,
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.005,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  child: Draggable<String>(
                    data: "HDMI 1",
                    child: DraggableWidget(0x80000000, "HDMI 1"),
                    feedback: DraggableWidget(0x80007C89, "HDMI 1"),
                    childWhenDragging: DraggableWidget(0x80000000, "HDMI 1"),
                  ),
                ),
                Container(
                  child: Draggable<String>(
                    data: "HDMI 2",
                    child: DraggableWidget(0x80000000, "HDMI 2"),
                    feedback: DraggableWidget(0x80007C89, "HDMI 2"),
                    childWhenDragging: DraggableWidget(0x80000000, "HDMI 2"),
                  ),
                ),                Container(
                  child: Draggable<String>(
                    data: "HDMI 3",
                    child: DraggableWidget(0x80000000, "HDMI 3"),
                    feedback: DraggableWidget(0x80007C89, "HDMI 3"),
                    childWhenDragging: DraggableWidget(0x80000000, "HDMI 3"),
                  ),
                ),                Container(
                  child: Draggable<String>(
                    data: "HDMI 4",
                    child: DraggableWidget(0x80000000, "HDMI 4"),
                    feedback: DraggableWidget(0x80007C89, "HDMI 4"),
                    childWhenDragging: DraggableWidget(0x80000000, "HDMI 4"),
                  ),
                ),                Container(
                  child: Draggable<String>(
                    data: "TV Tuner",
                    child: DraggableWidget(0x80000000, "TV Tuner"),
                    feedback: DraggableWidget(0x80007C89, "TV Tuner"),
                    childWhenDragging: DraggableWidget(0x80000000, "TV Tuner"),
                  ),
                ),                Container(
                  child: Draggable<String>(
                    data: "Wireless",
                    child: DraggableWidget(0x80000000, "Wireless"),
                    feedback: DraggableWidget(0x80007C89, "Wireless"),
                    childWhenDragging: DraggableWidget(0x80000000, "Wireless"),
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.025,
                bottom: MediaQuery.of(context).size.height * 0.025,
                left: MediaQuery.of(context).size.width * screenMargins,
                right: MediaQuery.of(context).size.width * screenMargins,
              ),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * screenSize,
                    color: Color(0xE6D9D9D9),
                    child: Center(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.40,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: buildDragTarget(1),
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
                            height: MediaQuery.of(context).size.height * 0.05,
                            alignment: Alignment.center,
                            child: projectorOne == false ||
                                    projectorOneSource == ""
                                ? Icon(
                                    Icons.volume_off,
                                    size: 40,
                                    color: Colors.redAccent,
                                  )
                                : Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (projectorOneVolume >= 10) {
                                              projectorOneVolume -= 10;
                                            }
                                          });
                                        },
                                        child: Icon(
                                          Icons.volume_down,
                                          size: 40,
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                    screenSize -
                                                80,
                                        child: SliderTheme(
                                          data: SliderThemeData(
                                            trackHeight: 10,
                                            // inactiveTrackColor: Colors.grey,
                                            activeTrackColor:
                                                Theme.of(context).primaryColor,
                                            // TO BE CONT
                                          ),
                                          child: Slider(
                                            value: projectorOneVolume,
                                            min: 0,
                                            max: 100,
                                            divisions: 10,
                                            label: projectorOneVolume
                                                .round()
                                                .toString(),
                                            onChanged: (double value) {
                                              setState(() {
                                                projectorOneVolume = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (projectorOneVolume <= 90) {
                                              projectorOneVolume += 10;
                                            }
                                          });
                                        },
                                        child: Icon(
                                          Icons.volume_up,
                                          size: 40,
                                        ),
                                      ),
                                    ],
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
                                    projectorOneSource = "";
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
                                    projectorTwoSource = "";
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
                                    projectorThreeSource = "";
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
