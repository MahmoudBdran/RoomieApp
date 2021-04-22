import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  Widget _facebookButton() {
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff1959a9),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text('f',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff2872ba),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    topRight: Radius.circular(5)),
              ),
              child: FlatButton(
                child: Text(
                  "facebook/roommates",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                onPressed: () {
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final _width=MediaQuery.of(context).size.width;
    final _height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          height: 40,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(
                  bottom: 0,
                  top: 0,
                  left: 2,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(EvaIcons.arrowIosBack),
                    color: Colors.white,
                  )),
              Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  child: Text("Contact us"))
            ],
          ),
        ),
      ),
      body: Center(
        child: Container(
            width: _width,
          height: _height,
          margin: EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,0,30),
                  child: Text("Contact us to report issue or develop our ideas.",style:GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.black54,

                  )),
                )
                ,Container(
                  width: _width,
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.contact_mail,color: Colors.teal,size: 45,),
                      SizedBox(width: 20,),
                      RaisedButton(
                        color: Colors.teal,
                        onPressed: () {  },
                        child: Text("roommates.reports@gmail.com",style:TextStyle(
                          color: Colors.white,

                        )),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 20,),
                _facebookButton()
              ],
            )
        ),
      ),
    );
  }
}
/*
,Container(
                    width: _width,
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                          color: Colors.blue[800],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text("f",style:GoogleFonts.poppins(
                          fontSize: 20,fontWeight: FontWeight.bold,
                          color: Colors.white
                        )),),
                        SizedBox(width: 20,),
                        RaisedButton(
                          color: Colors.blue[800],
                          onPressed: () {  },
                          child: Text("roommates.reports@gmail.com",style:TextStyle(
                            fontSize: 20,
                            color: Colors.white,

                          )),
                        ),

                      ],
                    ),
                  )
 */