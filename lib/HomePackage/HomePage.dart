import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roommates/APIServices/shared_service.dart';
import 'package:roommates/AddAdPackage/AddAd.dart';
import 'package:roommates/AddFriendsPackage/AddFriends.dart';
import 'package:roommates/ContactUsPackage/ContactUs.dart';
import 'package:roommates/FollowersPackage/Followers.dart';
import 'package:roommates/FollowingPackage/Following.dart';
import 'package:roommates/MessagesPackage/Messages.dart';
import 'package:roommates/NewsFeedPackage/NewsFeed.dart';
import 'package:roommates/NotificationsPackage/Notifications.dart';
import 'package:roommates/ProfilePackage/Profile.dart';
import 'package:roommates/SavedAdsPackage/SavedAds.dart';
import 'package:roommates/EditProfilePackage/EditProfile.dart';
import 'package:roommates/PostDetailsPackage/PostContainer.dart';
import 'package:roommates/login_package/loginPage.dart';
import 'package:roommates/theme/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut().then((_) => print("User logged out from firebase"));
  }
  getUserData()async{

  }
  List<Widget> pages=[
    NewsFeed(),
    Messages(),
    Profile(),
  ];
  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Roomie',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          children: [
            TextSpan(
              text: 'App',
              style: TextStyle(color: Colors.teal[800], fontSize: 30),
            ),
          ]),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("current user is "+FirebaseAuth.instance.currentUser.email+" : "+FirebaseAuth.instance.currentUser.uid);Future<void> deleteUser() {
      FirebaseFirestore.instance
          .collection('chat')
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          FirebaseFirestore.instance.collection("chat").doc(doc.id).delete();
        });
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          children: pages,
        ),
        drawer: Drawer(
          child: SingleChildScrollView(
            child: FutureBuilder(
              future:FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).get(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return Column(
                    children: [
                      UserAccountsDrawerHeader(
                        accountName: Text(snapshot.data['username']),
                        accountEmail: Text(snapshot.data['email']),
                        currentAccountPicture:  Container(
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(snapshot.data['profile_image']))),
                        ),
                      ),
                      ListTile(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => SavedAds(),
                          ));
                        },
                        leading: Icon(EvaIcons.bookmarkOutline,size: 25,color: Colors.teal[800]),
                        title: Text("Saved ads",style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                            fontWeight: FontWeight.normal
                        ),),
                      ),
                      ListTile(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Following(),
                          ));
                        },
                        leading: Icon(EvaIcons.personOutline,size: 25,color: Colors.teal[800]),
                        title: Text("Following",style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                            fontWeight: FontWeight.normal
                        ),),
                      ),
                      ListTile(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Followers(),
                          ));
                        },
                        leading: Icon(EvaIcons.personOutline,size: 25,color: Colors.teal[800]),
                        title: Text("Followers",style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                            fontWeight: FontWeight.normal
                        ),),
                      ),
                      ListTile(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => AddFriends(),
                          ));
                        },
                        leading: Icon(EvaIcons.personAddOutline,size: 25,color: Colors.teal[800]),
                        title: Text("Add friends",style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                            fontWeight: FontWeight.normal
                        ),),
                      ),
                      ListTile(
                        onTap: (){
                          setState(() {
                            Navigator.of(context).pop();
                          });
                        },
                        leading: Icon(EvaIcons.creditCardOutline
                            ,size: 25,color: Colors.teal[800]),
                        title: Text("Promote ads",style:TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                            fontWeight: FontWeight.normal
                        ),),
                      ),
                      ListTile(
                        onTap: () async {

                          // SharedPreferences prefs = await SharedPreferences.getInstance();
                          //prefs.remove('user_id');
                          // Navigator.pushReplacement(context,
                          //     MaterialPageRoute(builder: (BuildContext ctx) => LoginPage()));

                          _signOut();
                          // SharedService.logout().then((_) {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                          // });
                        },
                        leading: Icon(EvaIcons.logOutOutline,size: 25,color: Colors.teal[800]),
                        title: Text("Log out",style:TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                            fontWeight: FontWeight.normal
                        ),),
                      ),
                      Divider(),
                      ListTile(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile(),));
                        },
                        leading: Icon(EvaIcons.settingsOutline,size: 25,color: Colors.teal[800]),
                        title: Text("Edit profile",style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                            fontWeight: FontWeight.normal
                        ),),
                      ),
                      ListTile(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs(),));
                        },
                        leading: Icon(Icons.contact_mail,size: 25,color: Colors.teal[800]),
                        title: Text("Contact us",style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                            fontWeight: FontWeight.normal
                        ),),
                      ),
                      ListTile(
                        leading: Icon(EvaIcons.infoOutline,size: 25,color: Colors.teal[800]),
                        title: Text("About developers",style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                            fontWeight: FontWeight.normal
                        ),),
                      ),
                    ],
                  );
                }else{
                  return SizedBox();
                }
              }
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: applicationColor,
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.teal[200],
            tabs: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.home,),
              ),
              Icon(EvaIcons.messageSquareOutline),
              Icon(EvaIcons.personOutline)
            ],
          ),
          title: Row(
            children: [
              _title(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddAd(),));
          },
          child:Icon(Icons.add,color: Colors.white,)
          ,backgroundColor: applicationColor,

        ),

      ),

    );
  }
}



/*
//bottom navigation var
  ,bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        notchMargin: 4,
        child: BottomNavigationBar(
          currentIndex: cur_Index,
          items: [
            BottomNavigationBarItem(
              icon: Icon(EvaIcons.homeOutline,color: cur_Index==0?Colors.teal:Colors.grey,),
              title:SizedBox.shrink(),
            ),
            BottomNavigationBarItem(
              icon: Icon(EvaIcons.bellOutline,color: cur_Index==1?Colors.teal:Colors.grey,),
              title:SizedBox.shrink(),
            ),
            BottomNavigationBarItem(
              icon: Icon(EvaIcons.messageSquareOutline,color: cur_Index==2?Colors.teal:Colors.grey,),
              title:SizedBox.shrink(),
            ),
            BottomNavigationBarItem(
              icon: Icon(EvaIcons.personOutline,color: cur_Index==3?Colors.teal:Colors.grey,),
              title:SizedBox.shrink(),
            ),
          ],
          onTap: (index){
            setState(() {
              cur_Index=index;
            });
          },
        ),
      ),
 */