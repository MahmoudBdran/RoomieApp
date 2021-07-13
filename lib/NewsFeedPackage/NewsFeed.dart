//import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roommates/AreaSearchPackage/AreaSearchScreen.dart';
import 'package:roommates/PostDetailsPackage/PostContainer.dart';
import 'package:roommates/PostDetailsPackage/Posts_%D9%90api_package/PostsModel.dart';
import 'package:roommates/PostDetailsPackage/postContainer2.dart';
import 'package:roommates/UserProfilePackage/UserProfile.dart';
import 'package:roommates/constant/data.dart';
class NewsFeed extends StatefulWidget {
  @override
  _NewsFeedState createState() => _NewsFeedState();
}
class _NewsFeedState extends State<NewsFeed> {
  Widget Search(){
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width/1.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            border: Border.all(color: Colors.grey[300]),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10,0,5,0),
                child: Icon(EvaIcons.searchOutline,color: Colors.grey,size: 28,),
              ),
              Text("Search in Specific area..",style: TextStyle(
                color: Colors.grey,
                fontSize: 18
              ),),
            ],
          ),

        ),
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => AreaSearchPage(),));
      },
    );
  }
  Widget Header(){
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).get(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          String username= snapshot.data['username'];
          List<String> usernameseparated=username.split(" ");
          return Padding(
            padding: const EdgeInsets.fromLTRB(10,5,10,0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(

                children: [
                  RichText(
                    text: TextSpan(
                        text: 'welcome,',
                        style: GoogleFonts.portLligatSans(
                          textStyle: Theme.of(context).textTheme.display1,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey[350],
                        ),
                        children: [
                          TextSpan(
                            text: '\n${usernameseparated[0]}',
                            style: TextStyle(color: Colors.teal[400], fontSize: 20),
                          ),
                        ]),
                  ),
                  Spacer(flex: 1,),
                  IconButton(tooltip: "profile picture",
                    onPressed: (){},
                    icon: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(snapshot.data['profile_image']),fit: BoxFit.cover)),
                    ),
                  )
                ],
              ),
            ),
          );
        }else{
          return SizedBox();
        }
      },
    );
  }
  // getPosts()async{
  //   await FirebaseFirestore.instance
  //       .collection('all_posts')
  //       .get()
  //       .then((QuerySnapshot querySnapshot) {
  //     querySnapshot.docs.forEach((doc) {
  //       var userId=doc["user_Id"];
  //       FirebaseFirestore.instance.collection("users").doc(userId).get().then((value) {
  //         print("avatar is "+value['profile_image']);
  //         print("phone is "+doc['phone']);
  //         postsList.insert(0, new PostsModel(
  //             type: doc['type'],
  //             sub_address:doc['sub_address'],
  //             avatar: value['profile_image'],
  //             username: value['username'],
  //             availability: doc["availability"].toString(),
  //             character:doc["character"],
  //             post_id: doc['postId'],
  //             email: doc['email'],
  //             phone: doc['phone'],
  //             price: doc['price'],
  //             pets: doc['pets'],
  //             guests: doc['guests'],
  //             smoking: doc['smoking'],
  //             gender: doc['gender'],
  //             time: doc['time'],
  //             images: doc['image'],
  //             description: doc['description'],
  //             address: doc['address']
  //         ));
  //       });
  //
  //     });
  //     //print("actual data "+postsList[0].smoking);
  //   });
  // }
  String x ;
  getthepost()async{
    FirebaseFirestore.instance.collection("all_posts").doc("02:09:00 Fri 9 Jul").get().then((value) {
      print(value.data()['username']);
    });
  }
  // getActual()async{
  //   FirebaseFirestore.instance
  //       .collection('all_posts')
  //       .get()
  //       .then((QuerySnapshot querySnapshot) {
  //     querySnapshot.docs.forEach((doc) {
  //       postsList.add(new PostsModel(
  //           character: doc['character'],
  //           address: doc['address'],
  //           sub_address: doc['sub_address'],
  //           avatar: doc['avatar'],
  //           description: doc['description'],
  //           gender: doc['gender'],
  //           guests : doc['guests'],
  //           pets : doc['pets'],
  //           phone : doc['phone'],
  //           price : doc['price'],
  //         smoking : doc['smoke'],
  //           time : doc['time'],
  //           type : doc['type'],
  //           username: doc['username'],
  //           //images: data['image'],
  //           availability: doc['availability'].toString(),
  //           //userId:doc['user_Id']
  //       ));
  //       print(postsList[0].sub_address);
  //       return PostTemplate(
  //           character: doc['character'],
  //           address: doc['address'],
  //           sub_address: doc['sub_address'],
  //           avatar: doc['avatar'],
  //           description: doc['description'],
  //           gender: doc['gender'],
  //           guests : doc['guests'],
  //           pets : doc['pets'],
  //           phone : doc['phone'],
  //           price : doc['price'],
  //           smoke : doc['smoke'],
  //           time : doc['time'],
  //           type : doc['type'],
  //           username: doc['username'],
  //           //images: data['image'],
  //           availability: doc['availability'].toString(),
  //           userId:doc['user_Id']
  //       );
  //     });
  //   });
  // }
  Future<List<PostsModel>> extPosts()async{
    List<PostsModel> postsList=[];
    FirebaseFirestore.instance.collection("all_posts").get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((DocumentSnapshot doc) {
        print(doc.data());
        PostsModel postsModel=PostsModel(
          user_Id:doc['user_Id'],
          availability: doc['availability'].toString(),
          username: doc['username'],
           avatar: doc['avatar'],
           sub_address: doc['sub_address'],
          type:  doc['type'],
          smoking:  doc['smoking'],
           phone: doc['phone'],
          price: doc['price'],
          pets: doc['pets'],
          gender: doc['gender'],
          character: doc['character'],
          address: doc['address'],
          guests: doc['guests'],
          //images: doc['image'],
          post_id: doc['postId'],
          description: doc['description'],
          time: doc['time'],

        );
        postsList.add(postsModel);
        print("hi is there "+postsList[0].character);
      });
    });
    return postsList;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // CollectionReference col = FirebaseFirestore.instance.collection("TestCollection");
    // col.doc().set({'name':"mahmoud"});
    //getthepost();
    //getPosts();
   // getActual();
    //extPosts();
  }

  @override
  Widget build(BuildContext context) {
    final _height=MediaQuery.of(context).size.height;
    final _width=MediaQuery.of(context).size.width;
    return ListView(

      children: [
        Header(),
        Search(),
        FutureBuilder(
            future: FirebaseFirestore.instance.collection("all_posts").get(),
            builder: (BuildContext context, snapshot) {
              if(snapshot.hasData){
                final List<DocumentSnapshot> documents = snapshot.data.docs;
                //return Center(child: Text(snapshot.data['character']),);
                return Column(
                    children: documents.reversed.map((doc) =>PostTemplate(
                        user_Id: doc['user_Id'],
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
        )
      ],
    );
  }

}
/*
PostTemplate(

                character: snapshot.data['character'],
                    address: snapshot.data['address'],
                    sub_address: snapshot.data['sub_address'],
                    avatar: snapshot.data['avatar'],
                    description: snapshot.data['description'],
                    gender: snapshot.data['gender'],
                    guests : snapshot.data['guests'],
                    pets : snapshot.data['pets'],
                    phone : snapshot.data['phone'],
                    price : snapshot.data['price'],
                    smoke : snapshot.data['smoking'],
                    time : snapshot.data['time'],
                    type : snapshot.data['type'],
                    username: snapshot.data['username'],
                    //images: data['image'],
                    availability: snapshot.data['availability'].toString(),
                    userId:snapshot.data['user_Id']
                );
 */