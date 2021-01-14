import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  Widget MessageItem(){
    return Container(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            ListTile(
              leading:CircleAvatar(child: Image.asset("images/user_avatar.png"),backgroundColor: Colors.transparent,radius: 30,),
              title:Text('Alise Jones',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),),
              subtitle: Text('Can we talk for 5 minutes?', style:
              TextStyle(
                  color: Colors.black38, fontSize: 14
              ),
              ),
              trailing: Text("5:30 AM",style:GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey[500]
              )),
            ),
            Divider(
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => MessageItem(),
    );
  }
}
