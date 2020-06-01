import 'package:bmicalculator/Const/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'BMICalcPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'BMI Calculator', home: MainPage());
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(15.0),),
            Text("BMI CALCULATOR", style: TextStyle( fontSize: 30.0, fontFamily: 'Dosis', color: mainColor(), fontWeight: FontWeight.bold),),
            Container(
                height: MediaQuery.of(context).size.height / 1.5,
                width: MediaQuery.of(context).size.width/ 1.05 ,
                child: SvgPicture.asset(
                  'assets/images/bmi.svg',
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "LETS GET STARTED  ",
                  style: TextStyle(fontSize: 25, fontFamily: 'Dosis', color: mainColor()),
                ),
                Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
                Container(
                  height: 60,
                  child: Hero( tag: 'bmiScreen', child:RaisedButton(
                    elevation: 5.0,
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => BMIPage()));},
                      color: mainColor(),
                      child: Icon(Icons.arrow_forward, color: Colors.white,size: 30.0,),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0))),
                ))
              ],
            )
          ],
        )),
      ),
    );
  }
}
