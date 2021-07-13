//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:roommates/constant/data.dart';
import 'package:roommates/theme/colors.dart';

class ChatDetailPage extends StatefulWidget {
  final String selectedUserId;

  ChatDetailPage(this.selectedUserId);

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  String get selectedUserId => widget.selectedUserId;
  String  _sendMessageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ref.doc("17:39:54 Wed 7 Jul").get().then((value) {
    //   print(value['message']);
    // });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: applicationColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: <Widget>[
                FutureBuilder(
                  future: FirebaseFirestore.instance.collection("users").doc(selectedUserId).get(),
                  builder: (context, snapshot) {
                   if(snapshot.hasData){
                     return Container(
                       width: 40,
                       height: 40,
                       decoration: BoxDecoration(
                           shape: BoxShape.circle,
                           image: DecorationImage(
                               image: NetworkImage(
                                   snapshot.data['profile_image']),
                               fit: BoxFit.cover)),
                     );
                   }else{
                     return SizedBox(width: 1,);
                   }
                  }
                ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FutureBuilder(
                  future: FirebaseFirestore.instance.collection("users").doc(selectedUserId).get(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                      return Text(
                        snapshot.data['username'],
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      );
                    }else{
                      return SizedBox(width: 1,);
                    }
                  }
                ),
                SizedBox(
                  height: 3,
                ),
              ],
            )
          ],
        ),
        actions: <Widget>[
          Icon(
            EvaIcons.moreVertical,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body:
          Stack(
            children: <Widget>[
              Container(height:MediaQuery.of(context).size.height-120,child: getBody()),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
                  height: 60,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: getBottom()
                      ),

                    ],

                  ),
                ),
              ),
            ],
          ),
    );
  }
  Widget getBottom() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.2)),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 10,
              child: Container(
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  cursorColor: Colors.black,
                  onChanged: (val){
                    _sendMessageController=val;
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Message",
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
              ),
            ),
            Expanded(
              flex: 2,
              child: IconButton(
                icon: Icon(Icons.send,size: 30,
                  color: Colors.grey,),
                onPressed: (){
                        print(_sendMessageController);
                        sendMessage(_sendMessageController, FirebaseAuth.instance.currentUser.uid, selectedUserId);
                },

              ),
            ),
          ],
        ),
      ),
    );
  }
  CollectionReference ref= FirebaseFirestore.instance.collection("chat_channel");


  FirebaseAuth auth =FirebaseAuth.instance;
  sendMessage(String msg,String senderId,String receiverId)async{

    String formattedDate = DateFormat('kk:mm:ss EEE d MMM').format(DateTime.now());
     ref.doc(formattedDate).set({
       'users':[
         FirebaseAuth.instance.currentUser.uid,
         selectedUserId
       ],
       'message':msg,
       'sender':senderId,
       'receiver':receiverId,
       'time':formattedDate,
     });
     print(formattedDate);
     print(FirebaseAuth.instance.currentUser.uid);
  }
  Widget getBody() {
    return Stack(
      children: [
        Image.asset(
          "images/chat_background.jpg",
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
        ),
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("chat_channel").snapshots(),
          builder: (context, snapshot) {

            List<MessageBubble> messageBubbles=[];
            if(snapshot.hasData){
              final messages = snapshot.data.docs;
              for(var message in messages){
                final messagetext=message['message'];
                final messageSender=message['sender'];
                print("the message is "+messagetext);
                if(auth.currentUser.uid==messageSender){

                  messageBubbles.insert(0,MessageBubble(isMe: true,message: messagetext));
                  //messageBubbles.insert(0,ChatBubble(isMe: true,profileImg: messages[1]['profileImg'],messageType: 1,message: messagetext));
                }else{
                  messageBubbles.insert(0,MessageBubble(isMe: false,message: messagetext));
                  //messageBubbles.insert(0,ChatBubble(isMe: false,profileImg: messages[1]['profileImg'],messageType: 1,message: messagetext));
                }
              }
            }
            return Expanded(
              child: ListView(
                reverse: true,
                children: messageBubbles,
              ),
            );
          },
        ),
      ],
    );
  }
}

class MessageBubble extends StatelessWidget {
  // final String messageSender;
  // final String messageText;
  // bool isMe;
  final bool isMe;
  //final String profileImg;
  final String message;
  // MessageBubble(this.messageSender, this.messageText,this.isMe);
   MessageBubble({
    this.isMe,
    //this.profileImg,
    this.message,
  });
  @override
  Widget build(BuildContext context) {
    if (isMe) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0,0,10,15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                    color:white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(5),
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Text(
                    message,
                    style: TextStyle(color: Colors.black87, fontSize: 17),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }else{
      return Padding(

        padding: const EdgeInsets.fromLTRB(10,0,0,15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                    color:applicationColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(5))),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Text(
                    message,
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
    // return Padding(
    //   padding:  EdgeInsets.all(10.0),
    //   child: Column(
    //     crossAxisAlignment: (messageSender==FirebaseAuth.instance.currentUser.email)?
    //     CrossAxisAlignment.end:CrossAxisAlignment.start,
    //     children: [
    //       Text(messageSender),
    //       Material(color: Colors.lightBlueAccent,
    //           borderRadius: isMe==true?BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30.0),bottomRight:Radius.circular(0.0),bottomLeft: Radius.circular(30.0) ):BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30.0),bottomRight:Radius.circular(30.0),bottomLeft: Radius.circular(0.0) ),
    //           elevation: 5,
    //           child: Padding(
    //             padding:  EdgeInsets.symmetric(vertical: 10,horizontal: 20),
    //             child: Text('$messageText',style: TextStyle(
    //                 fontSize: 15.0,
    //                 color: Colors.white
    //             ),),
    //           )),
    //     ],
    //   ),
    // );
  }
}




/*
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:roommates/constant/data.dart';
import 'package:roommates/theme/colors.dart';

class ChatDetailPage extends StatefulWidget {
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  TextEditingController _sendMessageController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: applicationColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: <Widget>[
            Stack(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://images.unsplash.com/photo-1521572267360-ee0c2909d518?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80"),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.lightGreenAccent[200],
                        shape: BoxShape.circle,

                      ),
                    )
                ),
              ],
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Tyler Nix",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "Active now",
                  style: TextStyle(
                      color: Colors.grey[200].withOpacity(0.6), fontSize: 14),
                )
              ],
            )
          ],
        ),
        actions: <Widget>[
          Icon(
            EvaIcons.moreVertical,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: getBody(),
      bottomSheet: getBottom(),
    );
  }

  Widget getBottom() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.2)),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Icon(
              Icons.face,
              color: Colors.grey,
              size: 35,
            ),
            SizedBox(
              width: 15,
            ),
            Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width - 180,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: TextField(
                    cursorColor: Colors.black,
                    controller: _sendMessageController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Message",
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  EvaIcons.attachOutline,
                  size: 30,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.keyboard_voice_outlined,
                  size: 30,
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getBody() {
    return Stack(
      children: [
        Image.asset(
          "images/chat_background.jpg",
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
        ),
        ListView(
          padding: EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 80),
          children: List.generate(messages.length, (index) {
            return ChatBubble(
                isMe: messages[index]['isMe'],
                messageType: messages[index]['messageType'],
                message: messages[index]['message'],
                profileImg: messages[index]['profileImg']);
          }),
        )
      ],
    );
  }
}

class ChatBubble extends StatelessWidget {
  final bool isMe;
  final String profileImg;
  final String message;
  final int messageType;
  const ChatBubble({
    Key key,
    this.isMe,
    this.profileImg,
    this.message,
    this.messageType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isMe) {
      return Padding(
        padding: const EdgeInsets.all(1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                    color:applicationColor,
                    borderRadius: getMessageType(messageType)),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Text(
                    message,
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.all(1.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(profileImg), fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 15,
            ),
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: getMessageType(messageType)),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Text(
                    message,
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
  }

  getMessageType(messageType) {
    if (isMe) {
      // start message
      if (messageType == 1) {
        return BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(5),
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30));
      }
      // middle message
      else if (messageType == 2) {
        return BorderRadius.only(
            topRight: Radius.circular(5),
            bottomRight: Radius.circular(5),
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30));
      }
      // end message
      else if (messageType == 3) {
        return BorderRadius.only(
            topRight: Radius.circular(5),
            bottomRight: Radius.circular(30),
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30));
      }
      // standalone message
      else {
        return BorderRadius.all(Radius.circular(30));
      }
    }
    // for sender bubble
    else {
      // start message
      if (messageType == 1) {
        return BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(5),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30));
      }
      // middle message
      else if (messageType == 2) {
        return BorderRadius.only(
            topLeft: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30));
      }
      // end message
      else if (messageType == 3) {
        return BorderRadius.only(
            topLeft: Radius.circular(5),
            bottomLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30));
      }
      // standalone message
      else {
        return BorderRadius.all(Radius.circular(30));
      }
    }
  }
}
 */