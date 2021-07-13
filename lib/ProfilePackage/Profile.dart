import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roommates/EditProfilePackage/EditProfile.dart';
import 'package:roommates/FollowingPackage/Following.dart';
import 'package:roommates/FollowersPackage/Followers.dart';
import 'package:roommates/PostDetailsPackage/PostContainer.dart';
import 'package:roommates/constant/data.dart';
import 'package:roommates/theme/colors.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Widget Cover_Profile_img(AsyncSnapshot snapshot){
    return Container(
      height: 260,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft:  Radius.circular(20)),child: Image.asset("images/cover_image.jpg",width: MediaQuery.of(context).size.width,height: 180,fit: BoxFit.cover,))),
          Positioned(
            top: 110,
            left: 0,
            right: 0,
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                border:Border.all(color: Colors.white,width: 4),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(snapshot.data['profile_image']))),
            ),
          ),

        ],
      ),
    );
  }
  Widget Username(AsyncSnapshot snapshot){
    return Container(
      alignment: Alignment.center,
      child: Text(snapshot.data['username'],style: GoogleFonts.actor(
        fontSize: 28,
        color: Colors.black54,
      ),),
    );
  }
  Widget Edit_Info(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)
        ),
        width: MediaQuery.of(context).size.width,
        child: FlatButton(
          child: Text("Edit info",style: GoogleFonts.actor(
            fontSize: 18,
            color: Colors.white,
          ),),
          color: applicationColor,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => EditProfile(),
            ));
          },
        ),
      ),
    );
  }
  Widget User_BasicInfo(AsyncSnapshot snapshot){
    return Container(

      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,9,0),
                  child: Icon(Icons.work,color: applicationColor),
                ),
                Flexible(
                  child: RichText(
                    text: TextSpan(
                        text: snapshot.data['work'],
                        style:TextStyle(
                          color: Colors.black54,
                        ),
                        children: [
                          TextSpan(
                            text: ' at ',
                            style: TextStyle(color: Colors.black45),
                          ),
                          TextSpan(
                            text: snapshot.data['work_at'],
                            style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,9,0),
                  child: Icon(Icons.school,color: applicationColor),
                ),
                Flexible(
                  child: RichText(
                    text: TextSpan(
                        text: 'Studies ',
                        style:TextStyle(
                          color: Colors.black54,
                        ),
                        children: [
                          TextSpan(

                            text: snapshot.data['study'],
                            style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: ' at ',
                            style: TextStyle(color: Colors.black45),
                          ),
                          TextSpan(

                            text: snapshot.data['study_at'],
                            style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,9,0),
                  child: Icon(Icons.home,color: applicationColor),
                ),
                Flexible(
                  child: RichText(
                    text: TextSpan(
                        text: 'Lives in  ',
                        style:TextStyle(
                          color: Colors.black54,
                        ),
                        children: [

                          TextSpan(

                            text: snapshot.data['live_in'],
                            style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,9,0),
                  child: Icon(Icons.location_on,color: applicationColor),
                ),
                Flexible(
                  child: RichText(
                    text: TextSpan(
                        text: 'From  ',
                        style:TextStyle(
                          color: Colors.black54,
                        ),
                        children: [

                          TextSpan(

                            text: snapshot.data['from'],
                            style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Map<String , dynamic> mymap={};
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FutureBuilder(
            future: FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).get(),
            builder: (context, snapshot) {
              if(snapshot.hasData){
                return Column(
                  children: [
                    Cover_Profile_img(snapshot),
                    Username(snapshot),
                    Edit_Info(),
                    User_BasicInfo(snapshot),
                  ],
                );
              }else{
                return SizedBox();
              }
            }
        ),
        FutureBuilder(
          future: FirebaseFirestore.instance.collection("all_posts").where("user_Id",isEqualTo: FirebaseAuth.instance.currentUser.uid).get(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              final List<DocumentSnapshot> documents = snapshot.data.docs;
              return Column(
                  children: documents.map((doc) =>PostTemplate(
                    user_Id: doc["user_Id"],
                      character: doc['character'],
                      address: doc['address'],
                      sub_address: doc['sub_address'],
                      avatar: doc['avatar'],
                      description: doc['description'],
                      gender: doc['gender'],
                      guests : doc['guests'],
                      pets : doc['pets'],
                      phone : doc['phone'],
                      price : doc['price'],
                      smoke : doc['smoking'],
                      time : doc['time'],
                      type : doc['type'],
                      username: doc['username'],
                      images: doc['image'],
                      availability: doc['availability'].toString(),
                  )).toList()
              );
            }else{
              return Container(alignment: Alignment.center,child: CircularProgressIndicator(),);
            }
          },

        )
      ],
    );
  }
}

/*
 return ListView.builder(
            itemCount: postData.length+4,
            itemBuilder: (context, index) {
              if(index==0){
                return Cover_Profile_img(snapshot);
              }else if(index==1){
                return Username(snapshot);
              }else if(index==2){
                return Edit_Info();
              }else if(index==3){
                return User_BasicInfo(snapshot);
              }else {
                return FutureBuilder(
                    future: FirebaseFirestore.instance.collection("posts").doc(FirebaseAuth.instance.currentUser.uid).get(),
                    builder: (BuildContext context, snapshot) {
                      if(snapshot.hasData){
                        final List<DocumentSnapshot> documents = snapshot.data.data();

                        //return Center(child: Text(snapshot.data['character']),);
                        return ListView(
                            children: documents.map((doc) =>PostTemplate(
                                character: doc['character'],
                                address: doc['address'],
                                sub_address: doc['sub_address'],
                                avatar: doc['avatar'],
                                description: doc['description'],
                                gender: doc['gender'],
                                guests : doc['guests'],
                                pets : doc['pets'],
                                phone : doc['phone'],
                                price : doc['price'],
                                smoke : doc['smoking'],
                                time : doc['time'],
                                type : doc['type'],
                                username: doc['username'],
                                images: doc['image'],
                                availability: doc['availability'].toString(),
                                userId:doc['user_Id']
                            )).toList()
                        );
                      }else{
                        return Center(child: CircularProgressIndicator(),);
                      }
                      // return ListView.builder(
                      //   itemCount:snapshot.data.toString().length,
                      //   itemBuilder: (context, index) {
                      //     if(snapshot.hasData){
                      //       return PostTemplate(index: index,
                      //           character: snapshot.data[index].character,
                      //           address: snapshot.data[index].address,
                      //           sub_address: snapshot.data[index].sub_address,
                      //           avatar: snapshot.data[index].avatar,
                      //           description: snapshot.data[index].description,
                      //           gender:snapshot.data[index].gender,
                      //           guests : snapshot.data[index].guests,
                      //           pets : snapshot.data[index].pets,
                      //           phone : snapshot.data[index].phone,
                      //           price : snapshot.data[index].price,
                      //           smoke : snapshot.data[index].smoke ,
                      //           time : snapshot.data[index].time ,
                      //           type : snapshot.data[index].type ,
                      //           username: snapshot.data[index].username ,
                      //           //images: data['image'],
                      //           availability: snapshot.data[index].availability.toString(),
                      //           userId:snapshot.data[index].user_Id
                      //       );
                      //     }else{
                      //       return CircularProgressIndicator();
                      //     }
                      //     // if(index==0){
                      //     //   return Header();
                      //     // }else if(index==1){
                      //     //   return Search();
                      //     // }else{
                      //       /*
                      //       if(snapshot.hasData){
                      //                       return PostTemplate(index: index,
                      //                           character: snapshot.data[index].character,
                      //                           address: snapshot.data[index].address,
                      //                           sub_address: snapshot.data[index].sub_address,
                      //                           avatar: snapshot.data[index].avatar,
                      //                           description: snapshot.data[index].description,
                      //                           gender:snapshot.data[index].gender,
                      //                           guests : snapshot.data[index].guests,
                      //                           pets : snapshot.data[index].pets,
                      //                           phone : snapshot.data[index].phone,
                      //                           price : snapshot.data[index].price,
                      //                           smoke : snapshot.data[index].smoke ,
                      //                           time : snapshot.data[index].time ,
                      //                           type : snapshot.data[index].type ,
                      //                           username: snapshot.data[index].username ,
                      //                           //images: data['image'],
                      //                           availability: snapshot.data[index].availability.toString(),
                      //                           userId:snapshot.data[index].user_Id
                      //                       );
                      //                     }else{
                      //                       return CircularProgressIndicator();
                      //                     }
                      //        */
                      //       // FirebaseFirestore.instance.collection("all_posts").doc("02:09:00 Fri 9 Jul").get().then((value) {
                      //       //   print(value.data()['username']);
                      //       //   print(value.data()['sub_address']);
                      //       //
                      //       // });
                      //       return Container();
                      //       // return PostTemplate(
                      //       //     character: postsList[0].character,
                      //       //     address: postsList[0].address ,
                      //       //     sub_address:postsList[0].sub_address ,
                      //       //     avatar: postsList[0].avatar ,
                      //       //     description: postsList[0].description ,
                      //       //     gender:  postsList[0].gender ,
                      //       //     guests : postsList[0].guests ,
                      //       //     pets : postsList[0].pets ,
                      //       //     phone : postsList[0].phone ,
                      //       //     price : postsList[0].price ,
                      //       //     smoke : postsList[0].smoking ,
                      //       //     time : postsList[0].time ,
                      //       //     type : postsList[0].type,
                      //       //     username: postsList[0].username ,
                      //       //     //images: data['image'],
                      //       //     availability: postsList[0].availability.toString(),
                      //       //     //userId:postsList[0].user_Id
                      //       // );
                      //
                      //
                      //
                      //
                      //
                      //
                      //       // if(!snapshot.hasData){
                      //       //   Map<String, dynamic> data = snapshot.data.data() as Map<String, dynamic>;
                      //       //   return PostTemplate(index: index,
                      //       //       character: data['character'],
                      //       //       address: data['address'],
                      //       //       sub_address: data['sub_address'],
                      //       //       avatar: data['avatar'],
                      //       //       description: data['description'],
                      //       //       gender: data['gender'],
                      //       //       guests : data['guests'],
                      //       //       pets : data['pets'],
                      //       //       phone : data['phone'],
                      //       //       price : data['price'],
                      //       //       smoke : data['smoke'],
                      //       //       time : data['time'],
                      //       //       type : data['type'],
                      //       //       username: data['username'],
                      //       //       //images: data['image'],
                      //       //       availability: data['availability'].toString(),
                      //       //       userId:data['user_Id']
                      //       //   );
                      //       // }else{
                      //       //   return CircularProgressIndicator();
                      //       // }
                      //       // return PostTemplate("images/user_avatar.png","Minna Tareq");
                      //     }
                      //
                      //
                      // );
                    }
                );
                // return PostTemplate(index-4);
                return Container();
              }
            },
          );
 */