import 'dart:async';

import 'package:bmicalculator/Const/Util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

int weight = 0;

class BMIPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BMIWidget());
  }
}

class BMIWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: <Widget>[
        Expanded(
            child: Row(
          children: <Widget>[
            Expanded(child: _tempCard("Hello 1")),
            Expanded(
                child: Column(
              children: <Widget>[
                Expanded(child: _tempCard("GENDER")),
                Expanded(child: weightCard())
              ],
            ))
          ],
        )),
        _bmiCalculateBtn(context)
      ],
    ));
  }
}

Widget _bmiCalculateBtn(BuildContext context) {
  return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 5,
      alignment: Alignment.center,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Flexible(
                flex: 3,
                child: Hero(
                    tag: 'bmiScreen',
                    child: RaisedButton(
                        padding: EdgeInsets.fromLTRB(15, 15, 20, 15),
                        color: Color(0xFF4E5A86),
                        textColor: Colors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        onPressed: () {},
                        child: const Text(
                          'Calculate BMI',
                          style: TextStyle(fontSize: 30),
                        )))),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Flexible(
                flex: 1,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("STUFF"),
                ))
          ]));
}

class weightCard extends StatefulWidget {
  @override
  _weightCardState createState() => _weightCardState();
}

class _weightCardState extends State<weightCard> {
  var _controller = TextEditingController();
  Timer timer;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: mainColor(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Flexible(
              flex: 1,
              child: Container(
                child: InkResponse(
                  splashColor: subColor(),
                  highlightColor: subColor(),
                  onTap: () {},
                  child: GestureDetector(
                    onTap: () {
                      var calcWeight = incrementWeight();
                      _controller.text = calcWeight.toString();
                    },
                    onTapDown: (TapDownDetails details) {
                      timer =
                          Timer.periodic(Duration(milliseconds: 100), (timer) {
                        setState(() {
                          var calcWeight = incrementWeight();
                          _controller.text = calcWeight.toString();
                        });
                      });
                    },
                    onTapCancel: () {
                      timer.cancel();
                    },
                    onTapUp: (TapUpDetails details) {
                      timer.cancel();
                    },
                    child: Icon(Icons.arrow_drop_up),
                  ),
                ),
              )),


//          setWeight(_controller, true),


          Flexible(
            flex: 4,
            child: TextField(
              controller: _controller,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hintText: "WEIGHT",
                  hintStyle: TextStyle(fontSize: 25),
                  counterText: "",
                  border: InputBorder.none),
              maxLength: 3,
              keyboardType: TextInputType.phone,
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly,
              ],
              style: TextStyle(
                  color: mainColor(), fontSize: 35, fontFamily: 'Dosis'),
            ),
          ),


//          setWeight(_controller, false)?

          Flexible(
              flex: 1,
              child: Container(
                child: InkResponse(
                  splashColor: subColor(),
                  highlightColor: subColor(),
                  onTap: () {},
                  child: GestureDetector(
                    onTap: () {
                      var calcWeight = decreaseWeight();
                      _controller.text = calcWeight.toString();
                    },
                    onTapDown: (TapDownDetails details) {
                      timer =
                          Timer.periodic(Duration(milliseconds: 100), (timer) {
                            setState(() {
                              var calcWeight = decreaseWeight();
                              _controller.text = calcWeight.toString();
                            });
                          });
                    },
                    onTapCancel: () {
                      timer.cancel();
                    },
                    onTapUp: (TapUpDetails details) {
                      timer.cancel();
                    },
                    child: Icon(Icons.arrow_drop_down),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class setWeight extends StatefulWidget {
  TextEditingController myController;
  bool isIncreaseWeight;

  setWeight(this.myController, this.isIncreaseWeight);

  @override
  _setWeightState createState() =>
      _setWeightState(myController, isIncreaseWeight);
}

class _setWeightState extends State<setWeight> {
  TextEditingController myController;
  bool isIncreaseWeight;

  _setWeightState(this.myController, this.isIncreaseWeight);

  Timer timer;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Container(
        child: InkResponse(
          splashColor: subColor(),
          highlightColor: subColor(),
          onTap: () {},
          child: GestureDetector(
              onTap: () {
                var calcWeight;
                if (isIncreaseWeight) {
                  calcWeight = incrementWeight();
                } else {
                  calcWeight = decreaseWeight();
                }
                myController.text = calcWeight.toString();
              },
              onTapDown: (TapDownDetails details) {
                timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
                  setState(() {
                    var calcWeight;
                    if (isIncreaseWeight) {
                      calcWeight = incrementWeight();
                    } else {
                      calcWeight = decreaseWeight();
                    }
                    myController.text = calcWeight.toString();
                  });
                });
              },
              onTapCancel: () {
                timer.cancel();
              },
              onTapUp: (TapUpDetails details) {
                timer.cancel();
              },
              child: getWeightIcon(isIncreaseWeight)),
        ),
      ),
    );
  }
}

Widget getWeightIcon(bool isIncreaseWeight) {
  if (isIncreaseWeight) {
    return Icon(Icons.arrow_drop_up);
  } else {
    return Icon(Icons.arrow_drop_down);
  }
}

int decreaseWeight() {
  var currWeight = weight - 1;
  if (currWeight >= 0) {
    weight = currWeight;
  }
  return weight;
}

int incrementWeight() {
  var currWeight = weight + 1;
  if (currWeight < 1000) {
    weight = currWeight;
  }
  return weight;
}

Widget _tempCard(String label) {
  return Card(
    child: Container(
      alignment: Alignment.center,
      child: Text(label),
    ),
  );
}
