import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roommates/PostDetailsPackage/Image_Carousel.dart';
import 'package:roommates/PostDetailsPackage/post_details.dart';
import 'package:roommates/PostDetailsPackage/post_photos_only.dart';
import 'package:roommates/UserProfilePackage/UserProfile.dart';
import 'package:roommates/constant/data.dart';
import 'package:url_launcher/url_launcher.dart';

class PostTemplate extends StatefulWidget {
  // ignore: non_constant_identifier_names
  int index;

  PostTemplate(this.index);

  @override
  _PostTemplateState createState() => _PostTemplateState();
}

class _PostTemplateState extends State<PostTemplate> {
  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print(' could not launch $command');
    }
  }

  String phone = "01205057427";
  List<String> imagesList = [
    'images/post_image.png',
    'images/cover_image.jpg',
    'images/post_image.png',
    'images/cover_image.jpg'
  ];
  int get index => widget.index;

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
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
                                image: NetworkImage(postData[index]['avatar']),
                                fit: BoxFit.cover)),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(3, 5, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              postData[index]['username'],
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              postData[index]["time"],
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
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostPhotosOnly(imagesList),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Image_Carousel(imagesList),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
                        child: Icon(Icons.location_on, color: Colors.teal[300]),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(3, 5, 0, 5),
                        child: Text(
                          postData[index]['address'],
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 8, 5),
                    child: Text(
                      postData[index]['price'] + "\$",
                      style: TextStyle(
                        color: Colors.green[600],
                        fontSize: 23,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(9, 0, 0, 5),
                child: Text(
                  postData[index]['sub address'],
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(3, 0, 0, 5),
                    child: Icon(
                      Icons.home,
                      color: Colors.teal[300],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(3, 0, 0, 5),
                    child: Text(
                      postData[index]['type'],
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(3, 0, 0, 5),
                    child: Icon(Icons.phone_iphone, color: Colors.teal[300]),
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
                            Clipboard.setData(new ClipboardData(text: postData[index]['phone']))
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
                    child: Text(
                      postData[index]['phone'],
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          color: Colors.grey,
                          icon: Icon(Icons.copy_outlined),
                          onPressed: () {
                            setState(() {
                              Clipboard.setData(new ClipboardData(text: postData[index]['phone']))
                                  .then((_) => print("copied"));
                              Fluttertoast.showToast(
                                  msg: "phone number in clipboard",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.grey,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              //Toast.show("phone number in clipboard", context,gravity: Toast.BOTTOM,duration: Toast.LENGTH_LONG,backgroundColor: Colors.grey);
                            });
                          }),
                      IconButton(
                          color: Colors.grey,
                          icon: Icon(Icons.phone),
                          onPressed: () {
                            setState(() {
                              customLaunch('tel:${postData[index]['phone']}');
                            });
                          }),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(9, 0, 9, 5),
                child: Text(
                  postData[index]['description'],
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 17,
                  ),
                ),
              ),
              Divider(
                height: 1,
              ),
              Row(
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
                      postData[index]['pets'],
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                height: 1,
              ),
              Row(
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
                      postData[index]['smoking'],
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                height: 1,
              ),
              Row(
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
                      postData[index]['guests'],
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                height: 1,
              ),
              Row(
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
                      postData[index]['gender'],
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                height: 1,
              ),
              Padding(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
