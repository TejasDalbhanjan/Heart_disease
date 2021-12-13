import 'package:Heart_Disease/Forms/registration.dart';
import 'package:flutter/material.dart';
//import 'Asa.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home_Screen.dart';
import 'Login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

List<String> finalcredential;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BOD',
      debugShowCheckedModeBanner: false,
      home: SplashS(),
    );
  }
}

class SplashS extends StatefulWidget {
  @override
  _SplashSState createState() => _SplashSState();
}

class _SplashSState extends State<SplashS> {
  @override
  void initState() {
    getValidationData().whenComplete(() async {
      Timer(
          Duration(seconds: 2),
          () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) =>
                      (finalcredential == null ? Registraion() : Home()),
                ),
              ));
    });
    super.initState();
  }

  Future getValidationData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      var obtainedcredential = pref.getStringList('credentials');
      finalcredential = obtainedcredential;
      print(obtainedcredential);
    });
    print(finalcredential);
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        body: Stack(fit: StackFit.expand, children: <Widget>[
      Column(children: <Widget>[
        Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images.png"),
                    ),
                    color: Colors.black.withOpacity(0.1),
                  ),
                ),
                Text(
                  "Heart Disease Prediction",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.height * 0.05),
                )
              ],
            ))
      ]),
    ]));
  }
}
