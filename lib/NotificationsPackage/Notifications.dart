import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  Widget NotificationItem(){
    return Container(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading:CircleAvatar(child: Image.asset("images/user_avatar.png"),backgroundColor: Colors.transparent,radius: 30,),
          title:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Asmaa Omar',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),),
              Text('commented on your ad.', style:
              TextStyle(
                  color: Colors.black38, fontSize: 14
              ),
              ),

            ],
          ),
          subtitle: Text("1 hour ago",style:GoogleFonts.poppins(
            fontSize: 12,
            color: Colors.grey[500]
          )),
          trailing: IconButton(
            onPressed: (){},
            icon: Icon(EvaIcons.moreHorizotnalOutline),
            color: Colors.grey[500],
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => NotificationItem(),
    );
  }
}