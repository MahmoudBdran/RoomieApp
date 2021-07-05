import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:roommates/APIServices/shared_service.dart';
import 'package:roommates/HomePackage/HomePage.dart';
import 'package:roommates/src/welcomePage.dart';

import 'login_package/loginPage.dart';
Widget _defaultHome=LoginPage();
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  bool _isLoggedIn=await SharedService.isLoggedIn();
  if(_isLoggedIn){
    _defaultHome=HomePage();
  }
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.teal,

      ),
      debugShowCheckedModeBanner: false,
      home: _defaultHome,
    );
  }
}

// class MyApp extends StatefulWidget {
//
//   @override
//   _MyAppState createState() => _MyAppState();
// }
// class _MyAppState extends State<MyApp> {
//   final pages = [
//     screen1(),
//     screen2(),
//     screen3(),
//     screen4(),
//
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.teal,
//         accentColor: Colors.teal,
//
//       ),
//       title: "Roommates",
//       home:Builder(
//         builder: (context) => LiquidSwipe(pages: pages),
//       )
//
//     );
//   }
// }