import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roommates/EditProfilePackage/EditProfile.dart';
import 'package:roommates/FriendRequestsPackage/FriendRequest.dart';
import 'package:roommates/FriendsPackage/Friends.dart';
import 'package:roommates/NewsFeedPackage/PostContainer.dart';
import 'package:roommates/constant/data.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
            child: CircleAvatar(radius: 70,backgroundColor: Colors.transparent,child: Image.asset("images/profile_image.png"),),
          ),
        ],
      ),
    );
  }
  Widget Username(){
    return Container(
      alignment: Alignment.center,
      child: Text("Mahmoud Bdran",style: GoogleFonts.actor(
        fontSize: 28,
        color: Colors.black54,
      ),),
    );
  }
  Widget UserStatus(){
    return  Container(alignment: Alignment.center,child: Text("Let's Do it...",style: TextStyle(
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
  Widget Edit_Info(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)
        ),
        width: MediaQuery.of(context).size.width,
        child: FlatButton(
          child: Text("Edit info",style: GoogleFonts.actor(
            fontSize: 18,
            color: Colors.white,
          ),),
          color: Colors.teal[400],
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => EditProfile(),
            ));
          },
        ),
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
                        text: 'Software Engineer',
                        style:TextStyle(
                          color: Colors.black54,
                        ),
                        children: [
                          TextSpan(
                            text: ' at ',
                            style: TextStyle(color: Colors.black45),
                          ),
                          TextSpan(
                            text: 'IBM company',
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
                            text: 'Marsa Matrouh',
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
                            text: 'Marsa Matrouh',
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
  Widget FriendshipChips(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 2),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          GestureDetector(
            onTap: (){

              Navigator.push(context, MaterialPageRoute(builder: (context) => Friends(),));
            },
            child: Chip(
              backgroundColor: Colors.grey[200],
              elevation: 3,
              label: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Friends",style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15
                ),),
              ),
            ),
          ),
          SizedBox(width: 20,),
          GestureDetector(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => FriendRequest(),));
          },
            child: Chip(
              backgroundColor: Colors.grey[200],
              elevation: 3,
              label: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Friend Requests",style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15
                ),),
              ),
            ),
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: postData.length+6,
      itemBuilder: (context, index) {
        if(index==0){
          return Cover_Profile_img();
        }else if(index==1){
          return Username();
        }else if(index==2){
          return UserStatus();
        }else if(index==3){
          return Edit_Info();
        }else if(index==4){
          return User_BasicInfo();
        }else if(index==5){
          return FriendshipChips();
        }else {
          return PostTemplate(index-6);
        }
      },
    );
  }
}
