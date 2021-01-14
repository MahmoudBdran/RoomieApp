import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    final _height=MediaQuery.of(context).size.height;
    final _width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          height: 40,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(bottom: 0,top: 0,left: 2,child: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(EvaIcons.arrowIosBack),color: Colors.white,)),
              Container(alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,child: Text("Edit profile"))
            ],
          ),
        ),
      ),
      body: Container(
        width: _width,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CircleAvatar(backgroundColor: Colors.transparent,child: Image.asset("images/profile_image.png"),radius: 60,),
            ),

          ],
        ),
      ),
    );
  }
}
