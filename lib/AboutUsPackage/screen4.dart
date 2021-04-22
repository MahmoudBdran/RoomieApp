import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roommates/src/loginPage.dart';
class screen4 extends StatefulWidget {
  @override
  _screen4State createState() => _screen4State();
}

class _screen4State extends State<screen4> {
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
                  child: Image.asset("images/friends.png",width: 120,height: 120,),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,20,0,0),
                  child: Text("Make Friends",style: GoogleFonts.poppins(
                    // color: Colors.teal[400],
                      color: Colors.white,
                      fontSize: 45,
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
                SizedBox(
                  height: 80,
                ),
                Container(
                  height: 70,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white,),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: FlatButton(
                    child: Text("Get Started",style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 19,
                    ),),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                    }
                    ,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
