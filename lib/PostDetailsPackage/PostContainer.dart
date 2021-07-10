import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roommates/PostDetailsPackage/Image_Carousel.dart';
import 'package:roommates/PostDetailsPackage/Posts_%D9%90api_package/PostsModel.dart';
import 'package:roommates/PostDetailsPackage/post_likes_page.dart';
import 'package:roommates/PostDetailsPackage/post_photos_only.dart';
import 'package:roommates/UserProfilePackage/UserProfile.dart';
import 'package:roommates/constant/data.dart';
import 'package:roommates/images_in_post.dart';
import 'package:roommates/theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class PostTemplate extends StatefulWidget {
  // ignore: non_constant_identifier_names
  int index;
  String pets;
  String smoke;
  String guests;
  String gender;
  String character;
  String description;
  String phone;
  String type;
  String sub_address;
  String address;
  String price;
  List images;
  String avatar;
  String username;
  String time;
  String availability;
  String userId;

  PostTemplate(
      {this.index,
      this.pets,
      this.smoke,
      this.guests,
      this.gender,
      this.character,
      this.description,
      this.phone,
      this.type,
      this.sub_address,
      this.address,
      this.price,
      this.images,
      this.avatar,
      this.username,
      this.time,
      this.availability,
      this.userId});

  @override
  _PostTemplateState createState() => _PostTemplateState();
}

class _PostTemplateState extends State<PostTemplate> {
  String people_type;
  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print(' could not launch $command');
    }
  }

  List<String> imagesList = [
    'images/post_image.png',
    'images/cover_image.jpg',
    'images/post_image.png',
    'images/cover_image.jpg'
  ];
 String get phone =>widget.phone;
  int get index => widget.index;
  String get pets => widget.pets;
  String get smoke => widget.smoke;
  String get guests => widget.guests;
  String get gender => widget.gender;
  String get character => widget.character;
  String get description => widget.description;
  String get type => widget.type;
  String get sub_address => widget.sub_address;
  String get address => widget.address;
  String get price => widget.price;
  List get images => widget.images;
  String get avatar => widget.avatar;
  String get username => widget.username;
  String get time => widget.time;
  String get availability => widget.availability;
  String get userId => widget.userId;
  Widget _buildPetsWD(String pets){
    return Visibility(
      visible: (character!="family")?true:false,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 10, 0, 5),
            child: Text(
              "Pets :",
              style: TextStyle(
                color: Colors.black45,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 10, 0, 5),
            child: Text(
              pets,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildSmokeWD(String smoke){
    return Visibility(
      visible: (character!="family")?true:false,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 10, 0, 5),
            child: Text(
              "Smoke :",
              style: TextStyle(
                color: Colors.black45,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 10, 0, 5),
            child: Text(
              smoke,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildGuestsWD(String guests){
    return Visibility(
      visible: (character!="family")?true:false,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 10, 0, 5),
            child: Text(
              "Guests :",
              style: TextStyle(
                color: Colors.black45,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 10, 0, 5),
            child: Text(
              guests,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildGenderWD(String gender){
    return Visibility(
      visible: (character!="family")?true:false,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 10, 0, 5),
            child: Text(
              "Gender :",
              style: TextStyle(
                color: Colors.black45,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 10, 0, 5),
            child: Text(
              gender,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildPeopleTypeWD(String character){
    return Visibility(
      visible: (character=="family")?true:false,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 10, 0, 5),
            child: Text(
              "Type :",
              style: TextStyle(
                color: Colors.black45,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 10, 0, 5),
            child: Text(
              "Family",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildDescriptionWD(String description){
    return Padding(
      padding: const EdgeInsets.fromLTRB(9, 0, 9, 5),
      child: Text(
        description,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 17,
        ),
      ),
    );
  }
  Widget _buildPhoneWD(String phone){
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(3, 0, 0, 5),
          child: Icon(Icons.phone_iphone, color: applicationColor),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(3, 5, 0, 5),
          child: Text(
            "phone: ",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 20,
            ),
          ),
        ),
        InkWell(
          onLongPress: (){
            setState(() {
              Clipboard.setData(new ClipboardData(text: phone))
                  .then((_) => print("copied"));
              Fluttertoast.showToast(
                  msg: "phone number in clipboard",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.grey,
                  textColor: Colors.white,
                  fontSize: 16.0);
            });
          },
          onTap: (){
            setState(() {
              customLaunch('tel:$phone');
            });
          },
          child: Text(
            phone,
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildTypeWD(String type){
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(3, 0, 0, 5),
          child: Icon(
            Icons.home,
            color: applicationColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(3, 0, 0, 5),
          child: Text(
            type,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 21,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildSubAddressWD(String sub_address){
    return Padding(
      padding: const EdgeInsets.fromLTRB(9, 0, 0, 5),
      child: Text(
        sub_address,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 15,
        ),
      ),
    );
  }
  Widget _buildAddressAndPriceWD(String address,String price){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
              child: Icon(Icons.location_on, color: applicationColor),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(3, 5, 0, 5),
              child: Text(
                address,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 21,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 5, 8, 5),
          child: Text(
            price + " EGP",
            style: TextStyle(
              color: Colors.green[600],
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildImageCarouselWD(List images){
    print(images.length);
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PostPhotosOnly(images),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
        //child: Image_Carousel(postData[index]['images']),
        child: ImagesContainerTemplate(imageList: images),
      ),
    );
  }
  Widget _buildAvatarWD(String avatar,String username,String time){
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(avatar),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(3, 5, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    time,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(
              flex: 1,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(EvaIcons.moreVertical),
              color: Colors.grey,
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserProfile(),
            ));
      },
    );
  }
  Widget _buildInteractionWDs(){
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              EvaIcons.heartOutline,
              color: Colors.grey[500],
            ),
            onPressed: () {},
          ),
          Text(
            "Like",
            style: TextStyle(color: Colors.black45),
          ),
          Spacer(
            flex: 1,
          ),
          IconButton(
            icon: Icon(
              EvaIcons.messageCircleOutline,
              color: Colors.grey[500],
            ),
            onPressed: () {},
          ),
          Text(
            "Comment",
            style: TextStyle(color: Colors.black45),
          ),
          Spacer(
            flex: 1,
          ),
          IconButton(
            icon: Icon(
              EvaIcons.bookmarkOutline,
              color: Colors.grey[500],
            ),
            onPressed: () {},
          ),
          Text(
            "Save",
            style: TextStyle(color: Colors.black45),
          ),
        ],
      ),
    );
  }

  List<PostsModel> postsList;
  List actualPosts;
  getPosts()async{
    await FirebaseFirestore.instance
        .collection('all_posts')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        var userId=doc["user_Id"];
        FirebaseFirestore.instance.collection("users").doc(userId).get().then((value) {
          print("avatar is "+value['profile_image']);
          print("phone is "+doc['phone']);
          postsList.insert(0, new PostsModel(
              type: doc['type'],
              sub_address:doc['sub_address'],
              avatar: value['profile_image'],
              username: value['username'],
              availability: doc["availability"].toString(),
              character:doc["character"],
              post_id: doc['postId'],
              email: doc['email'],
              phone: doc['phone'],
              price: doc['price'],
              pets: doc['pets'],
              guests: doc['guests'],
              smoking: doc['smoking'],
              gender: doc['gender'],
              time: doc['time'],
              images: doc['image'],
              description: doc['description'],
              address: doc['address']
          ));
          //actualPosts.add(postsList[0]);
        });

      });
      //print("actual data "+postsList[0].smoking);
    });
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Container(
      width: _width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: _width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.grey[300], width: 1),
          ),
          child: SingleChildScrollView(
            child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildAvatarWD(avatar,username,time),
                    _buildImageCarouselWD(images),
                    _buildAddressAndPriceWD(address,price),
                    _buildSubAddressWD(sub_address),
                    _buildTypeWD(type),
                    _buildPhoneWD(phone),
                    _buildDescriptionWD(description),
                    Divider(
                      height: 1,
                    ),
                    _buildPeopleTypeWD(character),
                    _buildPetsWD(pets),
                    //divider
                    Visibility(
                      visible: (character!="family")?true:false,
                      child: Divider(
                        height: 1,
                      ),
                    ),
                    _buildSmokeWD(smoke),
                    //divider
                    Visibility(
                      visible: (character!="family")?true:false,
                      child: Divider(
                        height: 1,
                      ),
                    ),
                    _buildGuestsWD(guests),
                    //divider
                    Visibility(
                      visible: (character!="family")?true:false,
                      child: Divider(
                        height: 1,
                      ),
                    ),
                    _buildGenderWD(gender),
                    Divider(
                      height: 1,
                    ),
                    _buildInteractionWDs()
                  ],
                ),
          )

        ),
      ),
    );
  }
}


/*
postsList!=null?
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAvatarWD(),
              _buildImageCarouselWD(),
              _buildAddressAndPriceWD(),
              _buildSubAddressWD(),
              _buildTypeWD(),
              _buildPhoneWD(),
              _buildDescriptionWD(),
              Divider(
                height: 1,
              ),
              _buildPeopleTypeWD(),
              _buildPetsWD(),
              //divider
              Visibility(
                visible: (postsList[index].character!="family")?true:false,
                child: Divider(
                  height: 1,
                ),
              ),
              _buildSmokeWD(),
              //divider
              Visibility(
                visible: (postsList[index].character!="family")?true:false,
                child: Divider(
                  height: 1,
                ),
              ),
              _buildGuestsWD(),
              //divider
              Visibility(
                visible: (postsList[index].character!="family")?true:false,
                child: Divider(
                  height: 1,
                ),
              ),
              _buildGenderWD(),
              _buildLikesWD(),
              Divider(
                height: 1,
              ),
              _buildInteractionWDs()
            ],
          ):CircularProgressIndicator(),
 */


 /*
 Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAvatarWD(),
              _buildImageCarouselWD(),
              _buildAddressAndPriceWD(),
              _buildSubAddressWD(),
              _buildTypeWD(),
              _buildPhoneWD(),
              _buildDescriptionWD(),
              Divider(
                height: 1,
              ),
              _buildPeopleTypeWD(),
              _buildPetsWD(),
              //divider
              Visibility(
                visible: (postData[index]["people_type"]!="family")?true:false,
                child: Divider(
                  height: 1,
                ),
              ),
              _buildSmokeWD(),
              //divider
              Visibility(
                visible: (postData[index]["people_type"]!="family")?true:false,
                child: Divider(
                  height: 1,
                ),
              ),
              _buildGuestsWD(),
              //divider
              Visibility(
                visible: (postData[index]["people_type"]!="family")?true:false,
                child: Divider(
                  height: 1,
                ),
              ),
              _buildGenderWD(),
              _buildLikesWD(),
              Divider(
                height: 1,
              ),
              _buildInteractionWDs()
            ],
          )
  */