import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:roommates/HomePackage/HomePage.dart';
import 'package:roommates/constant/data.dart';
import 'package:roommates/login_package/constants.dart';
import 'package:roommates/src/Widget/bezierContainer.dart';
import 'loginPage.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  bool hidePassword=true;
  final _formKey = GlobalKey<FormState>();
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
  Widget _buildSignupBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed:(){
          if (validateAndSave()){
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ));
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
      onTap: onTap,
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
            initialValue: "eve.holt@reqres.in",
            keyboardType: TextInputType.emailAddress,
            validator: (input) => !input.contains('@')
                ? "Email Id should be valid"
                : null,
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
            initialValue: "01205057427",
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
          decoration: kBoxDecorationStyle,
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
          decoration: kBoxDecorationStyle,
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
          decoration: kBoxDecorationStyle,
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
          decoration: kBoxDecorationStyle,
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
          decoration: kBoxDecorationStyle,
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
            initialValue: "12345678",
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
            initialValue: "123456789",
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

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
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
                        // Padding(
                        //   padding: const EdgeInsets.fromLTRB(0,1,0,0),
                        //   child: Icon(Icons.location_on,size: 90,color: Colors.orange[800],),
                        // ),
                        // _title(),
                        // SizedBox(
                        //   height: 10,
                        // ),
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
                                        image:AssetImage("images/no_image_avatar.png"),
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
                                      onPressed:(){},
                                      icon: Icon(Icons.camera_alt_outlined,color: Colors.black,size: 18,)),
                                ),
                              ),

                            ],
                          ),
                          width: MediaQuery.of(context).size.width/4,
                          height: MediaQuery.of(context).size.width/4,
                        ),
                        //_title(),
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
                        _buildSignupBtn(),
                        _buildSignUpWithText(),
                        _buildSocialBtnRow(),
                        // Container(
                        //   margin: EdgeInsets.symmetric(vertical: 10),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: <Widget>[
                        //       Text(
                        //         "Username",
                        //         style: GoogleFonts.poppins(fontSize: 15,
                        //           color: Colors.grey[500],),
                        //       ),
                        //       SizedBox(
                        //         height: 10,
                        //       ),
                        //       TextFormField(
                        //         //obscureText: isPassword,
                        //           validator: (val){
                        //             if(val.isEmpty){
                        //               return 'please fill this field';
                        //             }else{
                        //               return null;
                        //             }
                        //           },
                        //           //keyboardType: (isPhone)?TextInputType.number:TextInputType.text,
                        //           decoration: InputDecoration(
                        //             prefixIcon: Icon(Icons.account_circle,color: Colors.teal,),
                        //               border: OutlineInputBorder(
                        //                 borderRadius: BorderRadius.circular(10),
                        //                 borderSide: BorderSide.none,
                        //               ),
                        //               fillColor: Color(0xfff3f3f4),
                        //               filled: true))
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Container(
                        //   margin: EdgeInsets.symmetric(vertical: 10),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: <Widget>[
                        //       Text(
                        //         "Email address",
                        //         style: GoogleFonts.poppins(fontSize: 15,
                        //           color: Colors.grey[500],),
                        //       ),
                        //       SizedBox(
                        //         height: 10,
                        //       ),
                        //       TextFormField(
                        //           validator: (val){
                        //             if(val.isEmpty){
                        //               return 'please fill this field';
                        //             }else if(!val.contains('@')){
                        //               return 'Enter valid email address';
                        //             }else{
                        //               return null;
                        //             }
                        //           },
                        //           keyboardType:TextInputType.emailAddress,
                        //           decoration: InputDecoration(
                        //             prefixIcon: Icon(Icons.account_circle,color: Colors.teal,),
                        //               border: OutlineInputBorder(
                        //                 borderRadius: BorderRadius.circular(10),
                        //                 borderSide: BorderSide.none,
                        //               ),
                        //               fillColor: Color(0xfff3f3f4),
                        //               filled: true))
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Container(
                        //   margin: EdgeInsets.symmetric(vertical: 10),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: <Widget>[
                        //       Text(
                        //         "Password",
                        //         style: GoogleFonts.poppins(fontSize: 15,
                        //           color: Colors.grey[500],),
                        //       ),
                        //       SizedBox(
                        //         height: 10,
                        //       ),
                        //       TextFormField(
                        //           obscureText: true,
                        //           validator: (val){
                        //             if(val.isEmpty){
                        //               return 'please fill this field';
                        //             }else{
                        //               return null;
                        //             }
                        //           },
                        //           decoration: InputDecoration(
                        //             prefixIcon: Icon(Icons.vpn_key,color: Colors.teal,),
                        //               border: OutlineInputBorder(
                        //                 borderRadius: BorderRadius.circular(10),
                        //                 borderSide: BorderSide.none,
                        //               ),
                        //               fillColor: Color(0xfff3f3f4),
                        //               filled: true))
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Container(
                        //   margin: EdgeInsets.symmetric(vertical: 10),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: <Widget>[
                        //       Text(
                        //         "Confirm Password",
                        //         style: GoogleFonts.poppins(fontSize: 15,
                        //           color: Colors.grey[500],),
                        //       ),
                        //       SizedBox(
                        //         height: 10,
                        //       ),
                        //       TextFormField(
                        //           obscureText: true,
                        //           validator: (val){
                        //             if(val.isEmpty){
                        //               return 'please fill this field';
                        //             }else{
                        //               return null;
                        //             }
                        //           },
                        //           decoration: InputDecoration(
                        //             prefixIcon: Icon(Icons.vpn_key,color: Colors.teal,),
                        //               border: OutlineInputBorder(
                        //                 borderRadius: BorderRadius.circular(10),
                        //                 borderSide: BorderSide.none,
                        //               ),
                        //               fillColor: Color(0xfff3f3f4),
                        //               filled: true))
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Container(
                        //   margin: EdgeInsets.symmetric(vertical: 10),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: <Widget>[
                        //       Text(
                        //         "Phone",
                        //         style: GoogleFonts.poppins(fontSize: 15,
                        //           color: Colors.grey[500],),
                        //       ),
                        //       SizedBox(
                        //         height: 10,
                        //       ),
                        //       TextFormField(
                        //           validator: (val){
                        //             if(val.isEmpty){
                        //               return 'please fill this field';
                        //             }else{
                        //               return null;
                        //             }
                        //           },
                        //           keyboardType:TextInputType.number,
                        //           decoration: InputDecoration(
                        //             prefixIcon: Icon(Icons.phone_iphone,color: Colors.teal,),
                        //               border: OutlineInputBorder(
                        //                 borderRadius: BorderRadius.circular(10),
                        //                 borderSide: BorderSide.none,
                        //               ),
                        //               fillColor: Color(0xfff3f3f4),
                        //               filled: true))
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Container(
                        //   margin: EdgeInsets.symmetric(vertical: 10),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: <Widget>[
                        //       Text(
                        //         "Work",
                        //         style: GoogleFonts.poppins(fontSize: 15,
                        //           color: Colors.grey[500],),
                        //       ),
                        //       SizedBox(
                        //         height: 10,
                        //       ),
                        //       TextFormField(
                        //           validator: (val){
                        //             if(val.isEmpty){
                        //               return 'please fill this field';
                        //             }else{
                        //               return null;
                        //             }
                        //           },
                        //           decoration: InputDecoration(
                        //             prefixIcon: Icon(Icons.work,color: Colors.teal,),
                        //               border: OutlineInputBorder(
                        //                 borderRadius: BorderRadius.circular(10),
                        //                 borderSide: BorderSide.none,
                        //               ),
                        //               fillColor: Color(0xfff3f3f4),
                        //               filled: true))
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Container(
                        //   margin: EdgeInsets.symmetric(vertical: 10),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: <Widget>[
                        //       Text(
                        //         "Work at",
                        //         style: GoogleFonts.poppins(fontSize: 15,
                        //           color: Colors.grey[500],),
                        //       ),
                        //       SizedBox(
                        //         height: 10,
                        //       ),
                        //       TextFormField(
                        //           validator: (val){
                        //             if(val.isEmpty){
                        //               return 'please fill this field';
                        //             }else{
                        //               return null;
                        //             }
                        //           },
                        //          decoration: InputDecoration(
                        //             prefixIcon: Icon(Icons.work,color: Colors.teal,),
                        //               border: OutlineInputBorder(
                        //                 borderRadius: BorderRadius.circular(10),
                        //                 borderSide: BorderSide.none,
                        //               ),
                        //               fillColor: Color(0xfff3f3f4),
                        //               filled: true))
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Container(
                        //   margin: EdgeInsets.symmetric(vertical: 10),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: <Widget>[
                        //       Text(
                        //         "Study",
                        //         style: GoogleFonts.poppins(fontSize: 15,
                        //           color: Colors.grey[500],),
                        //       ),
                        //       SizedBox(
                        //         height: 10,
                        //       ),
                        //       TextFormField(
                        //          validator: (val){
                        //             if(val.isEmpty){
                        //               return 'please fill this field';
                        //             }else{
                        //               return null;
                        //             }
                        //           },
                        //           decoration: InputDecoration(
                        //             prefixIcon:Icon(Icons.school,color: Colors.teal,),
                        //               border: OutlineInputBorder(
                        //                 borderRadius: BorderRadius.circular(10),
                        //                 borderSide: BorderSide.none,
                        //               ),
                        //               fillColor: Color(0xfff3f3f4),
                        //               filled: true))
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Container(
                        //   margin: EdgeInsets.symmetric(vertical: 10),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: <Widget>[
                        //       Text(
                        //         "Study at",
                        //         style: GoogleFonts.poppins(fontSize: 15,
                        //           color: Colors.grey[500],),
                        //       ),
                        //       SizedBox(
                        //         height: 10,
                        //       ),
                        //       TextFormField(
                        //           validator: (val){
                        //             if(val.isEmpty){
                        //               return 'please fill this field';
                        //             }else{
                        //               return null;
                        //             }
                        //           },
                        //           decoration: InputDecoration(
                        //             prefixIcon: Icon(Icons.school,color: Colors.teal,),
                        //               border: OutlineInputBorder(
                        //                 borderRadius: BorderRadius.circular(10),
                        //                 borderSide: BorderSide.none,
                        //               ),
                        //               fillColor: Color(0xfff3f3f4),
                        //               filled: true))
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Container(
                        //   margin: EdgeInsets.symmetric(vertical: 10),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: <Widget>[
                        //       Text(
                        //         "Lives in",
                        //         style: GoogleFonts.poppins(fontSize: 15,
                        //           color: Colors.grey[500],),
                        //       ),
                        //       SizedBox(
                        //         height: 10,
                        //       ),
                        //       TextFormField(
                        //           validator: (val){
                        //             if(val.isEmpty){
                        //               return 'please fill this field';
                        //             }else{
                        //               return null;
                        //             }
                        //           },
                        //           decoration: InputDecoration(
                        //             prefixIcon: Icon(Icons.home,color: Colors.teal,),
                        //               border: OutlineInputBorder(
                        //                 borderRadius: BorderRadius.circular(10),
                        //                 borderSide: BorderSide.none,
                        //               ),
                        //               fillColor: Color(0xfff3f3f4),
                        //               filled: true))
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Container(
                        //   margin: EdgeInsets.symmetric(vertical: 10),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: <Widget>[
                        //       Text(
                        //         "From",
                        //         style: GoogleFonts.poppins(fontSize: 15,
                        //           color: Colors.grey[500],),
                        //       ),
                        //       SizedBox(
                        //         height: 10,
                        //       ),
                        //       TextFormField(
                        //           validator: (val){
                        //             if(val.isEmpty){
                        //               return 'please fill this field';
                        //             }else{
                        //               return null;
                        //             }
                        //           },
                        //           decoration: InputDecoration(
                        //             prefixIcon:Icon(Icons.location_on,color: Colors.teal,),
                        //               border: OutlineInputBorder(
                        //                 borderRadius: BorderRadius.circular(10),
                        //                 borderSide: BorderSide.none,
                        //               ),
                        //               fillColor: Color(0xfff3f3f4),
                        //               filled: true))
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // _submitButton(),
                        // _facebookButton(),
                        // _googleButton()
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
