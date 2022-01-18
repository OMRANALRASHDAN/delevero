import 'package:delivero/main.dart';
import 'package:delivero/screen/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';

class Splash_Screen extends StatefulWidget {
  Splash_Screen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Splash_Screen>
    with SingleTickerProviderStateMixin {
  GifController controller;

  _asyncMethod() async {
    controller =
        await GifController(duration: const Duration(seconds: 4), vsync: this);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _asyncMethod();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SplashScreen(
          backgroundColor: Colors.white,
           photoSize: 120,
          seconds: 5,
    navigateAfterSeconds: MyApp(),
          image: Column(
            children: [


                // padding: EdgeInsets.only(top: 70),
              SizedBox(height: 60,),
              Expanded(
                flex: 1,
             child: Image.asset(
                    "lib/assets/images/logo.png",
                    fit: BoxFit.cover,

                ),
           ),
              SizedBox(height: 10,),

              Text(
                'Food Delivery',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 28,
                    fontWeight: FontWeight.w900),
              )
            ],
          ),

          //Container(child: Image.asset("lib/assets/images/logo.png")),

          loaderColor: Colors.red,
          loadingText: Text('Please Wait'),
        ),
      ),
    );
  }
}
