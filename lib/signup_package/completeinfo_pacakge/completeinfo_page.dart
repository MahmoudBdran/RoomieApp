import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roommates/HomePackage/HomePage.dart';
import 'package:roommates/login_package/constants.dart';

class CompleteInfo extends StatefulWidget {
  @override
  _CompleteInfoState createState() => _CompleteInfoState();
}

class _CompleteInfoState extends State<CompleteInfo> {
  Widget _buildWorkTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Work',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: LightBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            initialValue: "Software engineer",
            keyboardType: TextInputType.emailAddress,
            validator: (input) => input.isEmpty
                ? "Please fill this field"
                : null,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.work,
                color: Colors.white,
              ),
              hintText: 'ex: Software Enginner',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildWorkAtTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Work at',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: LightBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            initialValue: "IBM company",
            keyboardType: TextInputType.emailAddress,
            validator: (input) => input.isEmpty
                ? "Please fill this field"
                : null,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.work,
                color: Colors.white,
              ),
              hintText: 'ex: Alahly Bank',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildStudyTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Study',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: LightBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            initialValue: "Information technology",
            keyboardType: TextInputType.emailAddress,
            validator: (input) => input.isEmpty
                ? "Please fill this field"
                : null,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.school,
                color: Colors.white,
              ),
              hintText: 'ex: Information Technology',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildStudyAtTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Study At',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: LightBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            initialValue: "Menoufia university",
            keyboardType: TextInputType.emailAddress,
            validator: (input) => input.isEmpty
                ? "Please fill this field"
                : null,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.school,
                color: Colors.white,
              ),
              hintText: 'ex: Menoufia university',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildLivesInTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Lives in',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: LightBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            initialValue: "Menoufia",
            keyboardType: TextInputType.emailAddress,
            validator: (input) => input.isEmpty
                ? "Please fill this field"
                : null,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              hintText: 'ex: menoufia',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildFromTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'From',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: LightBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            initialValue: "Masrsa matrouh",
            keyboardType: TextInputType.emailAddress,
            validator: (input) => input.isEmpty
                ? "Please fill this field"
                : null,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.location_on,
                color: Colors.white,
              ),
              hintText: 'ex: marsa matrouh',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
  File _imageForIdVerification;
  final pickerForIdVerification = ImagePicker();
  Future pickImageForIdVerfication() async {
    final pickedFile = await pickerForIdVerification.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _imageForIdVerification = File(pickedFile.path);
        print("path is : "+_imageForIdVerification.path);
      } else {
        print('No image selected.');
      }
    });
  }
  Widget _buildPickImageBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed:pickImageForIdVerfication,
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Color(0xFF014139),
        child: Text(
          'Pick image',
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,28,0,0),
                  child: Text(
                    'Complete filling your info.',
                    style: kLabelStyleblack,
                  ),
                ),
                _buildWorkTF(),
                _buildWorkAtTF(),
                _buildStudyTF(),
                _buildStudyAtTF(),
                _buildLivesInTF(),
                _buildFromTF(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: Center(
                    child: _imageForIdVerification == null
                        ? Text('NOTE: one of our application policies is to take a personal photo of yourself and your national id is next to you.',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600),)
                        : Image.file(_imageForIdVerification),
                  ),
                ),
                SizedBox(height: 10.0),
                _buildPickImageBtn(),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
                      },
                      child: Text("Pass over",style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
                      },
                      child: Text("Submit",style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*
Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
                      },
                      child: Text("Pass over"),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
                      },
                      child: Text("Submit"),
                    ),
                  ],
                )
 */


/*
Positioned(
                  bottom: 0,
                  left: 20,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0,30,0,0),
                    child: InkWell(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
                      },
                      child: Text("Pass over",style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),),
                    ),
                  )),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: InkWell(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
                    },
                    child: Text("Submit"),
                  )),
 */