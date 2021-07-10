import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roommates/PostDetailsPackage/PostContainer.dart';
import 'package:roommates/constant/data.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  Widget Cover_Profile_img(){
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Image.asset("images/cover_image.jpg",width: MediaQuery.of(context).size.width,height: 200,fit: BoxFit.cover,),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: CircleAvatar(radius: 70,backgroundColor: Colors.transparent,child: Image.asset("images/user_avatar.png"),),
          ),
        ],
      ),
    );
  }
  Widget Username(){
    return Container(
      alignment: Alignment.center,
      child: Text("Minna Tareq",style: GoogleFonts.actor(
        fontSize: 28,
        color: Colors.black54,
      ),),
    );
  }
  Widget UserStatus(){
    return  Container(alignment: Alignment.center,child: Text("Secret life always wins.",style: TextStyle(
        color: Colors.black38
    ),));
  }
  Widget Addfriend_more_btns(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width-130,
            child: FlatButton(
              child: Text("Add friend",style: GoogleFonts.actor(
                fontSize: 18,
                color: Colors.white,
              ),),
              color: Colors.teal[400],
              onPressed: (){},
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Container(
            width: 60,
            height: 40,
            child: FlatButton(
              child: Icon(EvaIcons.moreHorizotnal,color: Colors.grey,),
              color: Colors.grey[200],
              onPressed: (){},
            ),
          ),

        ],
      ),
    );
  }
  Widget User_BasicInfo(){
    return Container(

      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,9,0),
                  child: Icon(Icons.work,color: Colors.teal,),
                ),
                Flexible(
                  child: RichText(
                    text: TextSpan(
                        text: 'IT Engineer',
                        style:TextStyle(
                          color: Colors.black54,
                        ),
                        children: [
                          TextSpan(
                            text: ' at ',
                            style: TextStyle(color: Colors.black45),
                          ),
                          TextSpan(
                            text: 'Cisco company',
                            style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,9,0),
                  child: Icon(Icons.school,color: Colors.teal,),
                ),
                Flexible(
                  child: RichText(
                    text: TextSpan(
                        text: 'Studies ',
                        style:TextStyle(
                          color: Colors.black54,
                        ),
                        children: [
                          TextSpan(
                            text: 'information technology',
                            style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: ' at ',
                            style: TextStyle(color: Colors.black45),
                          ),
                          TextSpan(
                            text: 'faculty of computers and information',
                            style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,9,0),
                  child: Icon(Icons.home,color: Colors.teal,),
                ),
                Flexible(
                  child: RichText(
                    text: TextSpan(
                        text: 'Lives in  ',
                        style:TextStyle(
                          color: Colors.black54,
                        ),
                        children: [

                          TextSpan(
                            text: 'Shebin el Kom',
                            style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,9,0),
                  child: Icon(Icons.location_on,color: Colors.teal,),
                ),
                Flexible(
                  child: RichText(
                    text: TextSpan(
                        text: 'From  ',
                        style:TextStyle(
                          color: Colors.black54,
                        ),
                        children: [

                          TextSpan(
                            text: 'Shebin el Kom',
                            style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: postData.length+5,
        itemBuilder: (context, index) {
          if(index==0){
            return Cover_Profile_img();
          }else if(index ==1){
            return Username();
          }else if(index==2){
            return Addfriend_more_btns();
          }else if(index ==3){
            return User_BasicInfo();
          }else {
            //return PostTemplate(index-4);
            return Container();
          }
        },
      ),
    );
  }
}
