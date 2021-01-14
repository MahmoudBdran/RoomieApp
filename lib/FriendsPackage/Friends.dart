import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class Friends extends StatefulWidget {
  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
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
              hintText: "Search in friends...",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none
              )
          ),
        ),
      ),
    );
  }

  Widget FriendRequestTemplate(){
    return Container(
      margin: EdgeInsets.all(10),
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
        trailing: IconButton(onPressed: (){},icon: Icon(EvaIcons.moreVertical),),
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
                  width: MediaQuery.of(context).size.width,child: Text("Friends"))
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          if(index==0){
            return Search();
          }else{
            return FriendRequestTemplate();
          }
        },
      ),
    );
  }
}
