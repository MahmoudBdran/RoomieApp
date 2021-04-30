import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:roommates/FollowersPackage/Followers.dart';
import 'package:roommates/constant/users.dart';
import 'package:roommates/theme/colors.dart';

class Following extends StatefulWidget {
  @override
  _FollowingState createState() => _FollowingState();
}
class _FollowingState extends State<Following> {
  Widget Search(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey[400],width: 1),),
        child: TextField(
          decoration: InputDecoration(
              prefixIcon:Icon(EvaIcons.searchOutline,color: Colors.grey,size: 28,),
              hintText: "Search in Following...",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none
              )
          ),
        ),
      ),
    );
  }
  Widget FollowingTemplate(index){
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[200],
            width: 1,
          )
        )
      ),
      width: MediaQuery.of(context).size.width,
      child: ListTile(
        leading: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(users[index]['avatar']),
                  fit: BoxFit.cover)),
        ),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(users[index]['username'],style: TextStyle(
              fontSize: 20
          ),),
        ),
        trailing: IconButton(onPressed: (){},icon: Icon(EvaIcons.moreVertical),),
      ),
    );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: applicationColor,
        automaticallyImplyLeading: false,
        title: Container(
          height: 40,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(bottom: 0,top: 0,left: 2,child: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(EvaIcons.arrowIosBack),color: Colors.white,)),
              Container(alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,child: Text("Following"))
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: users.length+1,
        itemBuilder: (context, index) {
          if(index==0){
            return Search();
          }else{
            return FollowingTemplate(index-1);
          }
        },
      ),
    );
  }
}
