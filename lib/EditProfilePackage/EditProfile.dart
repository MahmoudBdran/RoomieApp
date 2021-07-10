import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:roommates/theme/colors.dart';

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
        onPressed: (){},
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
      {String from,
      String lives_in,
      String phone,
      String study,
      String username,
      String work,
      String work_at})async{

      FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).update(
          {
            "from":from,
            "live_in":lives_in,
            "phone":phone,
            "study":study,
            "username":username,
            "work":work,
            "work_at":work_at,

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
            // If the form is valid, display a Snackbar.
            updateData(username: username,phone: phone,from: from,lives_in: lives_in,study: study,work: work,work_at: work_at);
          }
        },
      ),
    );
  }
  String username;
  //String email;
  String phone;
  String work;
  String work_at;
  String study;
  String lives_in;
  String from;

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
                  Padding(
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
                                onSaved: (val){
                                  username=val;
                                  print(username);
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
                                  onSaved: (val){
                                phone=val;
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
                                  onSaved: (val){
                                work=val;
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
                                  onSaved: (val){
                                    study=val;
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
                                  onSaved: (val){
                                    lives_in=val;
                                  },
                                initialValue: snapshot.data['live_in'],
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
                                  onSaved: (val){
                                    from=val;
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