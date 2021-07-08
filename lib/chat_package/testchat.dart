// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// class ChatScreen extends StatefulWidget {
//
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//
//   TextEditingController messageController;
//   String messagetext="";
//   final auth = FirebaseAuth.instance;
//   CollectionReference msg=FirebaseFirestore.instance.collection("test5ra");
//
//   @override
//   Widget build(BuildContext context) {
//     print(auth.currentUser.email);
//     print(auth.currentUser.phoneNumber);
//
//     return Scaffold(
//       appBar:AppBar(
//         title: Text("my App Bar"),
//
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           StreamBuilder<QuerySnapshot>(
//             stream: msg.snapshots(),
//             builder: (context, snapshot) {
//
//               List<MessageBubble> messageBubbles=[];
//               if(snapshot.hasData){
//                 final messages = snapshot.data.docs;
//                 for(var message in messages){
//                   final messagetext=message['message'];
//                   final messageSender=message['sender'];
//                   if(auth.currentUser.email==messageSender){
//                     messageBubbles.insert(0,MessageBubble(messageSender, messagetext,true));
//                   }else{
//                     messageBubbles.insert(0,MessageBubble(messageSender, messagetext,false));
//                   }
//                 }
//               }
//               return Expanded(
//                 child: ListView(
//                   reverse: true,
//                   children: messageBubbles,
//                 ),
//               );
//             },
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Container(
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Expanded(child: TextField(
//                     controller:messageController,
//                     onChanged: (value){
//                       messagetext=value;
//                     },
//                     decoration: InputDecoration(
//                       border:InputBorder.none,
//                       hintText:"\tType your message here...",
//                     ),
//                   )),
//                   FlatButton(
//                       color: Colors.transparent,
//                       onPressed: (){
//
//                         if(messagetext==""){
//                           print("msg is empty");
//                         }else{
//                           String formattedDate = DateFormat('kk:mm:ss EEE d MMM').format(DateTime.now());
//                           msg.doc(formattedDate).set({
//                             'message':messagetext,
//                             'sender':auth.currentUser.uid,
//                             'receiver':"fsdfsdfsdfsdf",
//                             'time':formattedDate,
//                           });
//                         }
//                       }, child: Text("send",style:TextStyle(color: Colors.lightBlueAccent,fontSize: 23),))
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
// class MessageBubble extends StatelessWidget {
//   final String messageSender;
//   final String messageText;
//   bool isMe;
//
//   MessageBubble(this.messageSender, this.messageText,this.isMe);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding:  EdgeInsets.all(10.0),
//       child: Column(
//         crossAxisAlignment: (messageSender==FirebaseAuth.instance.currentUser.email)?
//         CrossAxisAlignment.end:CrossAxisAlignment.start,
//         children: [
//           Text(messageSender),
//           Material(color: Colors.lightBlueAccent,
//               borderRadius: isMe==true?BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30.0),bottomRight:Radius.circular(0.0),bottomLeft: Radius.circular(30.0) ):BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30.0),bottomRight:Radius.circular(30.0),bottomLeft: Radius.circular(0.0) ),
//               elevation: 5,
//               child: Padding(
//                 padding:  EdgeInsets.symmetric(vertical: 10,horizontal: 20),
//                 child: Text('$messageText',style: TextStyle(
//                     fontSize: 15.0,
//                     color: Colors.white
//                 ),),
//               )),
//         ],
//       ),
//     );
//   }
// }
//
