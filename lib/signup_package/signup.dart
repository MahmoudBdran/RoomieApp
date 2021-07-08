import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roommates/APIServices/login_service.dart';
import 'package:roommates/HomePackage/HomePage.dart';
import 'package:roommates/constant/data.dart';
import 'package:roommates/login_package/constants.dart';
import 'package:roommates/signup_package/API_package/signup_model.dart';
import 'package:roommates/signup_package/verify_package/verifypage.dart';
import 'package:roommates/src/Widget/bezierContainer.dart';
import '../login_package/loginPage.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  File _imageForIdVerification;
  final pickerForIdVerification = ImagePicker();
  File _profileImage;
  final profileImagePicker= ImagePicker();
  String usernameController;
  String emailController;
  String passwordController;
  String phoneController;
  String workController;
  String workAtController;
  String livesInController;
  String fromController;
  String studyController;
  String studyAtController;
  String downloadUrl;
  // Future uploadImageToFirebase() async {
  //   await firebase_storage.FirebaseStorage.instance
  //       .ref()
  //       .child('users/${Uri.file(_profileImage.path).pathSegments.last}').putFile(_profileImage).then((value) {
  //         value.ref.getDownloadURL().then((value) {
  //           print("The download url is "+ value.toString());
  //           setState(() {
  //             downloadUrl=value;
  //           });
  //         });
  //   });
  // }
  // Future pickImageForIdVerfication() async {
  //   final pickedFile = await pickerForIdVerification.getImage(source: ImageSource.camera);
  //   setState(() {
  //     if (pickedFile != null) {
  //       _imageForIdVerification = File(pickedFile.path);
  //       print("path is : "+_imageForIdVerification.path);
  //     } else {
  //       print('No image selected.');
  //     }
  //   });
  // }
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
  bool hidePassword=true;
  final _formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  Future<void> signUp(String email,String password)async{
    try{
      print("email is : "+email);
      print("password is : "+password);
      await auth.createUserWithEmailAndPassword(email: email, password: password).then((_){

        CollectionReference userInfo=FirebaseFirestore.instance.collection("users");
        userInfo.doc(FirebaseAuth.instance.currentUser.uid).set({
          'username':usernameController,
          'uid':auth.currentUser.uid,
          "email":auth.currentUser.email,
          'phone':phoneController,
          //'profileCoverImage': profileCoverImage,
          'profile_image':downloadUrl,
          'work': workController,
          'work_at':workAtController,
          'live_in': livesInController,
          'from':fromController,
          'study': studyController,
          'study_at':studyAtController
        }).then((_) {
          firebase_storage.FirebaseStorage.instance
              .ref()
              .child('users/${auth.currentUser.uid}/profile_image').putFile(_profileImage).then((value) {
            value.ref.getDownloadURL().then((value) {
              print("The download url is "+ value.toString());
              userInfo.doc(FirebaseAuth.instance.currentUser.uid).update({
                "profile_image":value
              }).then((_) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),)));
            });
          });
        });
       });

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Icon(Icons.arrow_back_ios, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
  Widget _submitButton() {
    return Container(
      height: 55,
      width: 360,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.teal[500], Colors.teal[300]])),
      child: FlatButton(
        child: Text(
          "Register",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 19,
          ),
        ),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            // If the form is valid, display a Snackbar.
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('Data is in processing.')));
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
          }
        },
      ),
    );
  }
  Widget _facebookButton() {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff1959a9),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text('f',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff2872ba),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    topRight: Radius.circular(5)),
              ),
              child: FlatButton(
                child: Text(
                  "Sign up with facebook",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _googleButton() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text('G+',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    topRight: Radius.circular(5)),
              ),
              child: FlatButton(
                child: Text(
                  "Sign up with google",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Room',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.grey[350],
          ),
          children: [
            TextSpan(
              text: 'mates',
              style: TextStyle(color: Colors.teal[400], fontSize: 30),
            ),
          ]),
    );
  }
  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
  // Future<void> _signOut() async {
  //   await FirebaseAuth.instance.signOut().then((_) {
  //     print("User logged out from firebase");
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
  //     });
  // }
  final scaffoldKey = GlobalKey<ScaffoldState>();
  SignUpRequestModel signUpRequestModel;
  Widget _buildSignupBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed:(){
          if (validateAndSave()){
            print("validated successfully");
            signUp(emailController, passwordController);
            // _signOut();
            // LoginService signUpService = LoginService();
            // signUpService.signUp(avatar: avatar,email: usernameController,password: passwordController).then((value){
            //
            //     if(value.id!=null){
            //       print("id is "+value.id.toString());
            //       final snackBar=SnackBar(
            //         content:Text("Login Successful"),
            //         backgroundColor: Colors.green,
            //       );
            //       scaffoldKey.currentState.showSnackBar(snackBar);
            //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
            //     }else{
            //       print("error");
            //       final snackBar=SnackBar(
            //         content:Text(value.message),
            //         backgroundColor: Colors.red,
            //       );
            //       scaffoldKey.currentState.showSnackBar(snackBar);
            //     }
            //
            // });
            // Navigator.pushReplacement(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => LoginPage(),
            //     ));
          }

        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Sign up',
          style: TextStyle(
            color: Color(0xFF419890),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
  // Widget _buildPickImageBtn() {
  //   return Container(
  //     padding: EdgeInsets.symmetric(vertical: 25.0),
  //     width: double.infinity,
  //     child: RaisedButton(
  //       elevation: 5.0,
  //       onPressed:pickImageForIdVerfication,
  //       padding: EdgeInsets.all(15.0),
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(30.0),
  //       ),
  //       color: Color(0xFF014139),
  //       child: Text(
  //         'Pick image',
  //         style: TextStyle(
  //           color: Color(0xFFFFFFFF),
  //           letterSpacing: 1.5,
  //           fontSize: 18.0,
  //           fontWeight: FontWeight.bold,
  //           fontFamily: 'OpenSans',
  //         ),
  //       ),
  //     ),
  //   );
  // }
  Widget _buildSignUpWithText() {
    return Column(
      children: <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          'Sign up with',
          style: kLabelStyle,
        ),
      ],
    );
  }
  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap as void Function(),
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }
  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(
                () => print('Login with Facebook'),
            AssetImage(
              'assets/logos/facebook.jpg',
            ),
          ),
          _buildSocialBtn(
                () => print('Login with Google'),
            AssetImage(
              'assets/logos/google.jpg',
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(

            keyboardType: TextInputType.emailAddress,
            validator: (input) => !input.contains('@')
                ? "Email Id should be valid"
                : null,
            onSaved: (val){
              // print(val+ " is val");
              // signUpRequestModel.email=val;
              // print(signUpRequestModel.email+ " is email");
              // signUpRequestModel.avatar="https://reqres.in/img/faces/7-image.jpg";

            },
            onChanged: (val){
            emailController=val;
          },
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Email address',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildUsernameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Username',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            onChanged: (val){
            usernameController=val;
          },
            initialValue: "mahmoud bdran",
            keyboardType: TextInputType.text,
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
                Icons.account_circle,
                color: Colors.white,
              ),
              hintText: 'Username',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            keyboardType: TextInputType.text,
            validator: (input) => input.length < 3
                ? "Password should be more than 3 characters"
                : null,
            onSaved: (val){
              // signUpRequestModel.password=val;
            },
            onChanged: (val){
              passwordController=val;
            },
            obscureText: hidePassword,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
                color: Theme.of(context)
                    .accentColor
                    .withOpacity(0.4),
                icon: Icon(hidePassword
                    ? Icons.visibility_off
                    : Icons.visibility),
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildConfirmPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Confirm password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            //initialValue: "123456789",

            keyboardType: TextInputType.text,
            validator: (input) => input.length < 3
                ? "Password should be more than 3 characters"
                : null,
            obscureText: hidePassword,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
                color: Theme.of(context)
                    .accentColor
                    .withOpacity(0.4),
                icon: Icon(hidePassword
                    ? Icons.visibility_off
                    : Icons.visibility),
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildPhoneTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Phone',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            onChanged: (val){
              phoneController=val;
            },
            //initialValue: "01205057427",
            keyboardType: TextInputType.number,
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
                Icons.phone_iphone,
                color: Colors.white,
              ),
              hintText: 'Phone number',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
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
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            onChanged: (val){
              workController=val;
            },
            //initialValue: "Software engineer",
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
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            onChanged: (val){
              workAtController=val;
            },
            //initialValue: "IBM company",
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
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            onChanged: (val){
              studyController=val;
            },
            //initialValue: "Information technology",
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
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            onChanged: (val){
              studyAtController=val;
            },
            //initialValue: "Menoufia university",
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
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            onChanged: (val){
              livesInController=val;
            },
            //initialValue: "Menoufia",
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
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            onChanged: (val){
              fromController=val;
            },
            //initialValue: "Masrsa matrouh",
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

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          height: height,
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF47CABD),
                      Color(0xFF2ACFBF),
                      Color(0xFF0CB8A8),
                      Color(0xFF009688),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: height * .08),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          child: Text(
                            'Create an account.',
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              letterSpacing: 1.5,
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image:(_profileImage==null?AssetImage("images/no_image_avatar.png"):FileImage(_profileImage)) as ImageProvider<Object>,
                                        fit: BoxFit.cover)),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    color: Colors.grey[400],
                                      ),

                                  child: IconButton(
                                      onPressed:pickImageForprofileImage,
                                      icon: Icon(Icons.camera_alt_outlined,color: Colors.black,size: 18,)),
                                ),
                              ),

                            ],
                          ),
                          width: MediaQuery.of(context).size.width/4,
                          height: MediaQuery.of(context).size.width/4,
                        ),
                        SizedBox(height: 10.0),
                       _buildUsernameTF(),
                        SizedBox(height: 30.0),
                        _buildEmailTF(),
                        SizedBox(height: 30.0,),
                        _buildPasswordTF(),
                        SizedBox(height: 30.0,),
                        _buildConfirmPasswordTF(),
                        SizedBox(height: 30.0),
                        _buildPhoneTF(),
                        SizedBox(height: 30.0),
                        _buildWorkTF(),
                        SizedBox(height: 30.0),
                        _buildWorkAtTF(),
                        SizedBox(height: 30.0),
                        _buildStudyTF(),
                        SizedBox(height: 30.0),
                        _buildStudyAtTF(),
                        SizedBox(height: 30.0),
                        _buildLivesInTF(),
                        SizedBox(height: 30.0),
                        _buildFromTF(),
                        SizedBox(height: 30.0),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          child: Center(
                            child: _imageForIdVerification == null
                                ? Text('NOTE: one of our application policies is to take a personal photo of yourself and your national id is next to you.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)
                                : Image.file(_imageForIdVerification),
                          ),
                        ),
                        SizedBox(height: 10.0),
                         //_buildPickImageBtn(),
                        _buildSignupBtn(),
                        _buildSignUpWithText(),
                        _buildSocialBtnRow(),

                      ],
                    ),
                  ),
                ),
              ),
              Positioned(top: 40, left: 0, child: _backButton()),
            ],
          ),
        ),
      ),
    );
  }

}
