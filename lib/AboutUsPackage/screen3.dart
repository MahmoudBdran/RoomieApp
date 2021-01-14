import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class screen3 extends StatefulWidget {
  @override
  _screen3State createState() => _screen3State();
}

class _screen3State extends State<screen3> {
  @override
  Widget build(BuildContext context) {
    final _height=MediaQuery.of(context).size.height;
    final _width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: _height,
            decoration: BoxDecoration(

                borderRadius: BorderRadius.all(Radius.circular(5)),
                // gradient: LinearGradient(
                //     begin: Alignment.topCenter,
                //     end: Alignment.bottomCenter,
                //     colors: [Colors.teal[500], Colors.teal[200]]),
                color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,160,0,0),
                  child: Icon(Icons.location_on,color: Colors.teal,size: 120,)
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,20,0,0),
                  child: Text("Find Places",style: GoogleFonts.poppins(
                    // color: Colors.teal[400],
                      color: Colors.teal,
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
                    color: Colors.teal[400],
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
