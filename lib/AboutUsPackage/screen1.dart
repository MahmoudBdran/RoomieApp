import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roommates/main.dart';

class screen1 extends StatefulWidget {
  screen1({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _screen1State createState() => _screen1State();
}

class _screen1State extends State<screen1> {
  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Room',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.grey[400],
          ),
          children: [
            TextSpan(
              text: 'mates',
              style: TextStyle(color: Colors.orange[800], fontSize: 30),
            ),

          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _height=MediaQuery.of(context).size.height;
    final _width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child:Container(
          height: _height,
          width: _width,
          child: Stack(
            children: [
              Container(
                height: _height,
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Image.asset("images/woman.png",fit: BoxFit.cover,height: 300,width: _width,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,10,0,0),
                      child: Icon(Icons.location_on,size: 90,color: Colors.orange[800],),
                    ),
                    _title(),
                    // SizedBox(
                    //   height: 50,
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                left: BorderSide(
                                    color: Colors.black45,
                                    width: 2
                                )
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5,0,0,0),
                          child: Text("Lorem ipsum dolor sit amet,"
                              " consectetur adipiscing elit, "
                              "sed do eiusmod tempor incididunt",style: GoogleFonts.poppins(
                            letterSpacing: 1,
                            textStyle: Theme.of(context).textTheme.display1,
                            fontSize: 20,
                            color: Colors.grey[350],
                          ),),
                        ),
                      ),
                    ),
                    // IconButton(
                    //   icon: Icon(Icons.arrow_forward_ios),
                    //   onPressed: (){
                    //     setState(() {
                    //     });
                    //   },
                    // )

                  ],
                ),
              ),
              Positioned(
                bottom: 0,
               left: 0,
               right: 0,
               child: Image.asset("images/boy.png",height: 200,width: 200,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
