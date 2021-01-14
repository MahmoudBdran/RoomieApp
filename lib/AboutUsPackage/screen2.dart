import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class screen2 extends StatefulWidget {
  @override
  _screen2State createState() => _screen2State();
}

class _screen2State extends State<screen2> {
  @override
  Widget build(BuildContext context) {
    final _height=MediaQuery.of(context).size.height;
    final _width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: _height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.teal[500], Colors.teal[200]]),
                color: Colors.white
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,160,0,0),
                  child: Image.asset("images/earn-moneywhite.png",width: 120,height: 120,),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,20,0,0),
                  child: Text("Earn Money",style: GoogleFonts.poppins(
                    // color: Colors.teal[400],
                    color: Colors.white,
                      fontSize: 50,
                    fontWeight: FontWeight.bold
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(38,28,20,0),
                  child: Text("Lorem ipsum dolor sit amet,consectetur adipiscing elit,"
                      "seddo eiusmod tempor incididunt "
                      "utlabore et dolore magna aliqua."
                      "Ut enim ad minim veniam, quisnostrud exercitation .",style: GoogleFonts.poppins(
                      color: Colors.grey[300],
                      fontSize: 19,
                  ),),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
