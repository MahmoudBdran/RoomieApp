import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roommates/chat_package/chat_detail_page.dart';
import 'package:roommates/chat_package/testchat.dart';
import 'package:roommates/constant/data.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {

  Widget MessageItem(
      {
        @required String uid,
        @required String username,
        @required String avatar,
        @required String time}){
    var auth=  FirebaseAuth.instance;
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_) => ChatDetailPage(uid)));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 12,bottom: 8),
        child:ListTile(
              leading:

                      Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image:
                              NetworkImage(
                                  avatar
                                //"https://firebasestorage.googleapis.com/v0/b/roomieapp-22942.appspot.com/o/users%2F1sWdBdD2MiUL7Hxs2NRcYvoM9Zr1%2Fprofile_image?alt=media&token=b561f623-3d09-4f41-8c66-edf909da36a5"
                              ),
                              fit: BoxFit.cover)),
                    ),
              title: Text(
                     username,
                     //"hhh",
                     style: TextStyle(
                         fontSize: 17, fontWeight: FontWeight.w500),
                   ),
            )

      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection("users").get(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          final List<DocumentSnapshot> documents = snapshot.data.docs;
          return ListView(
            children: documents.map((doc) =>doc['uid']!=FirebaseAuth.instance.currentUser.uid?MessageItem(
                uid:doc['uid'],
                username:doc['username'],
                avatar:doc['profile_image']
            ):SizedBox(width: 1,)).toList(),
          );
        }else{
          return Center(
              child: CircularProgressIndicator(),);
        }
    }
    );
  }
}
