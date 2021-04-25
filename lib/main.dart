import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:roommates/APIServices/shared_service.dart';
import 'package:roommates/HomePackage/HomePage.dart';
import 'file:///E:/flutter_projects/roommates/lib/AboutUsPackage/screen1.dart';
import 'file:///E:/flutter_projects/roommates/lib/AboutUsPackage/screen2.dart';
import 'file:///E:/flutter_projects/roommates/lib/AboutUsPackage/screen3.dart';
import 'file:///E:/flutter_projects/roommates/lib/AboutUsPackage/screen4.dart';
import 'package:roommates/src/welcomePage.dart';
Widget _defaultHome=MyApp();
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  bool _isLoggedIn=await SharedService.isLoggedIn();
  if(_isLoggedIn){
    _defaultHome=HomePage();
  }
  runApp(MyApp());
}
class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  final pages = [
    screen1(),
    screen2(),
    screen3(),
    screen4(),

  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.teal,

      ),
      title: "Roommates",
      home:Builder(
        builder: (context) => LiquidSwipe(pages: pages),
      )

        /*
        Carousel(
          boxFit: BoxFit.cover,
          autoplay: false,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(milliseconds: 1000),
          dotSize: 6.0,
          dotIncreasedColor: Colors.teal,
          dotBgColor: Colors.transparent,
          dotPosition: DotPosition.bottomCenter,
          dotVerticalPadding: 10.0,
          showIndicator: true,
          indicatorBgPadding: 7.0,
          images: [
            Screen1(),
            screen2(),
            screen3(),
            screen4()
          ],
        ),
         */


    );
  }
}
 /*
 PageView(
          physics: AlwaysScrollableScrollPhysics(),
          scrollDirection:Axis.horizontal,
          controller: pageController,
          children: [
            Screen1(),
            screen2(),
            screen3(),
          ],
        ),
  */