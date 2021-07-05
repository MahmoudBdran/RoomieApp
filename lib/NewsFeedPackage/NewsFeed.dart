import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roommates/AreaSearchPackage/AreaSearchScreen.dart';
import 'package:roommates/PostDetailsPackage/PostContainer.dart';
import 'package:roommates/UserProfilePackage/UserProfile.dart';
import 'package:roommates/constant/data.dart';
class NewsFeed extends StatefulWidget {
  @override
  _NewsFeedState createState() => _NewsFeedState();
}
class _NewsFeedState extends State<NewsFeed> {
  Widget Search(){
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width/1.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            border: Border.all(color: Colors.grey[300]),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10,0,5,0),
                child: Icon(EvaIcons.searchOutline,color: Colors.grey,size: 28,),
              ),
              Text("Search in Specific area..",style: TextStyle(
                color: Colors.grey,
                fontSize: 18
              ),),
            ],
          ),

        ),
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => AreaSearchPage(),));
      },
    );
  }
  Widget Header(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(10,5,10,0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(

          children: [
            RichText(
              text: TextSpan(
                  text: 'welcome,',
                  style: GoogleFonts.portLligatSans(
                    textStyle: Theme.of(context).textTheme.display1,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey[350],
                  ),
                  children: [
                    TextSpan(
                      text: '\nMahmoud',
                      style: TextStyle(color: Colors.teal[400], fontSize: 20),
                    ),
                  ]),
            ),
            Spacer(flex: 1,),
            IconButton(
              icon: CircleAvatar(child: Image.asset("images/profile_image.png"),backgroundColor: Colors.transparent,), onPressed: () {  },
            )
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final _height=MediaQuery.of(context).size.height;
    final _width=MediaQuery.of(context).size.width;
    return ListView.builder(
      itemCount: postData.length+2,
      itemBuilder: (context, index) {
        if(index==0){
          return Header();
        }else if(index==1){
          return Search();
        }else{
          return PostTemplate(index-2);
          // return PostTemplate("images/user_avatar.png","Minna Tareq");
        }
      },

    );
  }

}
