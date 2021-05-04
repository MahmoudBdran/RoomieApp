import 'package:flutter/material.dart';
import 'package:roommates/constant/data.dart';
import 'package:roommates/constant/users.dart';

class PostLikesPage extends StatefulWidget {
  int postId;

  PostLikesPage({this.postId});

  @override
  _PostLikesPageState createState() => _PostLikesPageState();
}

class _PostLikesPageState extends State<PostLikesPage> {
  int get postId =>widget.postId;

  List<String> likes_users;
  List<int> usersindexes=[];
  parsingUsersIndexes(){
    likes_users=postData[postId-1]['likes_uid'];
    print(likes_users);
    print("post id is : "+postId.toString());

    for(int j = 0 ; j<likes_users.length;j++){
      for(int i = 0 ; i <users.length;i++){
        if(users[i]['id']==likes_users[j]){
          usersindexes.add(i);
          print("userIndexes in index "+i.toString()+" is "+usersindexes[i].toString());
        }
      }
    }
    print(usersindexes);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    parsingUsersIndexes();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: postData[postId-1]['likes_uid'].length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(users[usersindexes[index]]['avatar']),
                          fit: BoxFit.cover)),
                ),
                title: Text(users[usersindexes[index]]['username']),
              );
            },
          ),
        ),
      ),
    );
  }
}

