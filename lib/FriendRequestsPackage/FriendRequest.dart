import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:roommates/FriendsPackage/Friends.dart';

class FriendRequest extends StatefulWidget {
  @override
  _FriendRequestState createState() => _FriendRequestState();
}

class _FriendRequestState extends State<FriendRequest> {
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
              hintText: "Search in friend requests...",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none
              )
          ),
        ),
      ),
    );
  }
  Widget FriendshipChips(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 2),
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.topLeft,
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
    );
  }
  Widget FriendRequestTemplate(){
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
        leading: CircleAvatar(radius:35,backgroundColor: Colors.transparent,child: Image.asset("images/user_avatar.png"),),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Asmaa omar",style: TextStyle(
            fontSize: 20
          ),),
        ),
        subtitle:  Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: 40,
              decoration: BoxDecoration(
                color: Colors.green[500],
                borderRadius: BorderRadius.circular(8),
              ),
              child: FlatButton(
                onPressed: () {  },
                child: Text("Approve",style: TextStyle(
                    color: Colors.white
                ),),
              ),
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(8),
              ),
              child: FlatButton(
                onPressed: () {  },
                child: Text("Decline",style: TextStyle(
                    color: Colors.black54
                ),),
              ),
            ),
          ],
        ),
        trailing: Text("5h",style: TextStyle(
          color: Colors.grey,
        ),),
      ),
    );
}
  @override
  Widget build(BuildContext context) {
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
                  width: MediaQuery.of(context).size.width,child: Text("Friend requests"))
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          if(index==0){
            return Search();
          }else if(index==1){
              return GestureDetector(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Friends(),));},child: FriendshipChips());
            }else{
            return FriendRequestTemplate();
          }
        },
      ),
    );
  }
}
