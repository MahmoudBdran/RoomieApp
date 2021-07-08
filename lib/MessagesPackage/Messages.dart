import 'package:eva_icons_flutter/eva_icons_flutter.dart';
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
  Widget MessageItem(var index){
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_) => ChatDetailPage()));
        //Navigator.push(context, MaterialPageRoute(builder: (_) => ChatScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 12,bottom: 8),
        child: ListTile(
          leading:userMessages[index]['online']?Stack(
            children: [
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image:
                        NetworkImage(userMessages[index]['img']),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                  bottom: 5,
                  right: 5,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.lightGreenAccent[200],
                      shape: BoxShape.circle,

                    ),
                  )
              )
            ],
          ):Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image:
                    NetworkImage(userMessages[index]['img']),
                    fit: BoxFit.cover)),
          ),
          title:Text(
            userMessages[index]['name'],
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(

            userMessages[index]['message'] ,
            style: TextStyle(
                fontSize: 15, color: Colors.blueGrey.withOpacity(0.8)
            ),
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Text(

            userMessages[index]['created_at'],
            style: TextStyle(
                fontSize: 15, color: Colors.grey.withOpacity(0.8)
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => MessageItem(index),
    );
  }
}
