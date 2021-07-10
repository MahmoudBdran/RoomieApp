import 'package:carousel_pro/carousel_pro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:roommates/APIServices/shared_service.dart';
import 'package:roommates/HomePackage/HomePage.dart';
import 'package:roommates/src/welcomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_package/loginPage.dart';
Widget _defaultHome=LoginPage();
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if(await FirebaseAuth.instance.currentUser != null){
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
