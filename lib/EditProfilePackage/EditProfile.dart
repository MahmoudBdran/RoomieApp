import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:roommates/HomePackage/HomePage.dart';
import 'package:roommates/theme/colors.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  getUserInfo()async{

  }

  final _formKey = GlobalKey<FormState>();
  DateTime currentDate = DateTime.now();
  final f = new DateFormat('dd/MM/yyyy');
  String selectedGender="male";
  Widget GenderWidget(AsyncSnapshot snapshot){
    List<DropdownMenuItem> genderList=[
      DropdownMenuItem(value: "male", child: Text("male"),),
      DropdownMenuItem(value: "female",child: Text("female"),)];
    return Container(
      width: MediaQuery.of(context).size.width,

      padding: EdgeInsets.all(18),
      child: Row(
        children: [
          Container(
            child: Text("Gender :",style: GoogleFonts.poppins(
              fontSize: 15,
              color: Colors.grey[500],
            ),),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(5, 0, 0,0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5)
              ),
              child: DropdownButton(
                value:snapshot.data['gender'],
                items: genderList, onChanged: (value) { setState(() {
                selectedGender=value;
              });},

              ),
            ),
          ),
        ],
      ),
    );
  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }
  Future pickImageForprofileImage() async {
    final pickedFile = await profileImagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _profileImage = File(pickedFile.path);
        print("path is : "+_profileImage.path);
      } else {
        print('No image selected.');
      }
    });
  }
  File _profileImage;
  final profileImagePicker= ImagePicker();
  Widget EditProfileImage(){
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 100,vertical: 15),
      decoration: BoxDecoration(
          color: applicationColor,
          borderRadius: BorderRadius.circular(8)
      ),
      width: MediaQuery.of(context).size.width,
      child: FlatButton(
        child: Text("change Profile Image",style: GoogleFonts.actor(
          color: Colors.white,
        ),),
        onPressed: (){
          pickImageForprofileImage();
        },
      ),
    );
  }
  Widget EditCoverImage(){
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 100,vertical: 15),
      decoration: BoxDecoration(
          color: applicationColor,
          borderRadius: BorderRadius.circular(8)
      ),
      width: MediaQuery.of(context).size.width,
      child: FlatButton(
        child: Text("change cover Image",style: GoogleFonts.actor(
          color: Colors.white,
        ),),
        onPressed: (){},
      ),
    );
  }
  updateData(
      {
        String avatar,
      String from,
      String lives_in,
      String phone,
      String study,
      String username,
      String work})async{

      FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).update(
          {
            "profile_image":avatar,
            "from":from,
            "live_in":lives_in,
            "phone":phone,
            "study":study,
            "username":username,
            "work":work,

          }).then((_) {
        firebase_storage.FirebaseStorage.instance
            .ref()
            .child('users/${FirebaseAuth.instance.currentUser.uid}/profile_image').putFile(_profileImage).then((value) {
          value.ref.getDownloadURL().then((value) {
            print("The download url is "+ value.toString());
            FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).update({
              "profile_image":value
            }).then((_) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),)));
          });
        });
      });
  }
  Widget SaveChangesButton(){
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 50,vertical: 15),
      decoration: BoxDecoration(
          color: applicationColor,
          borderRadius: BorderRadius.circular(8)
      ),
      width: MediaQuery.of(context).size.width,
      child: FlatButton(
        child: Text("Save changes",style: GoogleFonts.actor(
          fontSize: 18,
          color: Colors.white,
        ),),
        onPressed: (){
          if (_formKey.currentState.validate()) {
           updateData(
               avatar:_profileImage.path,
               username: usernameController.text,
               phone: phoneController.text,
               from: fromController.text,
               lives_in: livesInController.text,
               study: studyController.text,
               work: workController.text);
          }
        },
      ),
    );
  }
  var livesInController= TextEditingController();
  var usernameController= TextEditingController();
  var workController= TextEditingController();
  var phoneController= TextEditingController();
  var studyController= TextEditingController();
  var fromController= TextEditingController();


  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: applicationColor,
        automaticallyImplyLeading: false,
        title: Container(
          height: 40,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(
                  bottom: 0,
                  top: 0,
                  left: 2,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(EvaIcons.arrowIosBack),
                    color: Colors.white,
                  )),
              Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  child: Text("Edit profile"))
            ],
          ),
        ),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).get(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator());
          }else{
            return Container(
              width: _width,
              child: ListView(
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.all(15.0),
                  //   child: Container(
                  //     width: 140,
                  //     height: 140,
                  //     decoration: BoxDecoration(
                  //         border:Border.all(color: Colors.white,width: 4),
                  //         shape: BoxShape.circle,
                  //         image: DecorationImage(
                  //             image: NetworkImage(snapshot.data['profile_image']))),
                  //   ),
                  // ),
                  _profileImage==null?Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                          border:Border.all(color: Colors.white,width: 4),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(snapshot.data['profile_image']))),
                    ),
                  ):Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
          width: 140,
          height: 140,
          decoration: BoxDecoration(
          border:Border.all(color: Colors.white,width: 4),
          shape: BoxShape.circle,
          image: DecorationImage(
          image: FileImage(_profileImage))),
          ),
          ),
                  EditProfileImage(),
                  Divider(
                    color: Colors.grey[700],
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        //username
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "username",
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: Colors.grey[500],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                  onChanged: (value){
                                    usernameController.text=value;
                                  },
                                initialValue: snapshot.data['username'],
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'please fill this field';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        EvaIcons.personOutline,
                                        color: applicationColor,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none,
                                      ),
                                      fillColor: Color(0xfff3f3f4),
                                      filled: true))
                            ],
                          ),
                        ),
                        //phone
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Phone",
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: Colors.grey[500],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                  onChanged: (value){
                                    phoneController.text=value;
                                  },
                                initialValue: snapshot.data['phone'],
                                  keyboardType: TextInputType.number,
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'please fill this field';
                                    } else if (val.contains('-') ||
                                        val.contains(' ') ||
                                        val.contains(',') ||
                                        val.contains('.')) {
                                      return 'enter valid phone number';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.phone_iphone,
                                        color: applicationColor,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none,
                                      ),
                                      fillColor: Color(0xfff3f3f4),
                                      filled: true))
                            ],
                          ),
                        ),
                        //work
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Work",
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: Colors.grey[500],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                  onChanged: (value){
                                    workController.text=value;
                                  },
                                initialValue: snapshot.data['work'],
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'please fill this field';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.work,
                                        color: applicationColor,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none,
                                      ),
                                      fillColor: Color(0xfff3f3f4),
                                      filled: true))
                            ],
                          ),
                        ),
                        //education
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Education",
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: Colors.grey[500],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(

                                  onChanged: (value){
                                studyController.text=value;
                                  },
                                initialValue: snapshot.data['study'],
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'please fill this field';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.school,
                                        color: applicationColor,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none,
                                      ),
                                      fillColor: Color(0xfff3f3f4),
                                      filled: true))
                            ],
                          ),
                        ),
                        //lives in
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Lives in",
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: Colors.grey[500],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                 initialValue: snapshot.data['live_in'],
                                  onChanged: (value){
                                   livesInController.text=value;
                                  },
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'please fill this field';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.home,
                                        color: applicationColor,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none,
                                      ),
                                      fillColor: Color(0xfff3f3f4),
                                      filled: true))
                            ],
                          ),
                        ),
                        //from
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "From",
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: Colors.grey[500],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                  onChanged: (value){
                                    fromController.text=value;
                                  },
                                  initialValue: snapshot.data['from'],
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'please fill this field';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.location_on,
                                        color: applicationColor,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none,
                                      ),
                                      fillColor: Color(0xfff3f3f4),
                                      filled: true))
                            ],
                          ),
                        ),
                        Divider(),
                      ],
                    ),
                  ),

                  SaveChangesButton(),
                ],
              ),
            );
          }
        }
      ),
    );
  }
}