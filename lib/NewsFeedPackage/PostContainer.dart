import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roommates/UserProfilePackage/UserProfile.dart';

class PostTemplate extends StatefulWidget {
  // ignore: non_constant_identifier_names
  String user_image;
  String username;

  PostTemplate(this.user_image, this.username);

  @override
  _PostTemplateState createState() => _PostTemplateState();
}

class _PostTemplateState extends State<PostTemplate> {
  String get userImage => widget.user_image;
  String get userName => widget.username;


  @override
  Widget build(BuildContext context) {
    final _height=MediaQuery.of(context).size.height;
    final _width=MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: _width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey[300],width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  CircleAvatar(child: Image.asset(userImage),backgroundColor: Colors.transparent,radius: 30,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(3,5,0,0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(userName,style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18,fontWeight: FontWeight.w400,
                          ),),
                          Text("3 hours ago",style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),),
                        ],
                      ),
                    ),
                    Spacer(flex: 1,),
                    IconButton(onPressed: (){},icon: Icon(EvaIcons.moreVertical),color: Colors.grey,),
                ],),
              ),
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile(),));
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,5,0,0),
              child: Image.asset("images/post_image.png",fit: BoxFit.cover,height: 300,),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8,5,0,5),
              child: Text("Cairo",style: TextStyle(
                color: Colors.black54,
                fontSize: 30,
              ),),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(9,0,0,5),
              child: Text("26 elReyad Tower, 6 october",style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8,0,0,5),
              child: Text("Flat",style: TextStyle(
                color: Colors.black54,
                fontSize: 30,
              ),),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(9,0,9,0),
              child: Text("Lorem ipsum dolor sit amet,consectetur adipiscing elit,"
                  "seddo eiusmod tempor incididunt "
                  "utlabore et dolore magna aliqua."
                  "Ut enim ad minim veniam, quisnostrud exercitation...",style: TextStyle(
                color: Colors.grey,
                fontSize: 17,
              ),),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8,5,0,5),
              child: Text("See More.",style: TextStyle(
                color: Colors.blue[800],
                fontSize: 18,
              ),),
            ),
            Divider(
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(EvaIcons.heartOutline,color: Colors.grey[500],), onPressed: () {  },
                  ),
                  Text("Like",style: TextStyle(
                    color: Colors.black45
                  ),),

                  Spacer(flex: 1,),
                  IconButton(
                    icon: Icon(EvaIcons.messageCircleOutline,color: Colors.grey[500],), onPressed: () {  },
                  ),
                  Text("Comment",style: TextStyle(
                      color: Colors.black45
                  ),),
                  Spacer(flex: 1,),
                  IconButton(
                    icon: Icon(EvaIcons.bookmarkOutline,color: Colors.grey[500],), onPressed: () {  },
                  )
                  ,Text("Save",style: TextStyle(
                      color: Colors.black45
                  ),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
