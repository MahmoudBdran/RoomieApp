import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:roommates/APIServices/login_model.dart';
import 'package:roommates/APIServices/login_service.dart';
import 'package:roommates/APIServices/shared_service.dart';
import 'package:roommates/HomePackage/HomePage.dart';
import 'package:roommates/login_package/constants.dart';
import 'package:roommates/theme/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../signup_package/signup.dart';
import 'package:google_fonts/google_fonts.dart';

import '../src/Widget/bezierContainer.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {



  signInFirebase()async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: "minna@yahoo.com", password: "1234466345");
  }
  signUpFirebase(String email,String password)async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  }


  LoginRequestModel loginRequestModel;
  bool isApiCallProcess = false;
  bool hidePassword=true;
  GlobalKey<FormState>_formKey =GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _rememberMe = false;
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
            onChanged: (val){

              loginRequestModel.email = val;
            },
            keyboardType: TextInputType.emailAddress,
            onSaved: (input) =>
            loginRequestModel.email = input,
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
              hintText: 'Enter your Email',
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
            onChanged: (val){

              loginRequestModel.password = val;
            },
            keyboardType: TextInputType.text,
            onSaved: (input) =>
            loginRequestModel.password = input,
            validator: (input) => input.length < 2
                ? "Password should be more than 2 characters"
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

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Remember me',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          if (validateAndSave()) {
            signIn(loginRequestModel.email,loginRequestModel.password);
            // print(loginRequestModel.toJson());
            // setState(() {
            //   isApiCallProcess = true;
            // });
            // LoginService apiService = new LoginService();
            // apiService.login(loginRequestModel).then((value) {
            //   if(value !=null){
            //     print("the response is "+value.id);
            //     setState(() {
            //       isApiCallProcess=false;
            //
            //     });
            //     if(value.id.isNotEmpty){
            //       final snackBar=SnackBar(
            //         content:Text("Login Successful"),
            //         backgroundColor: Colors.green,
            //       );
            //       scaffoldKey.currentState.showSnackBar(snackBar);
            //       SharedService.setLoginDetails(value);
            //       Navigator.of(context).pushReplacementNamed("/home");
            //     }else{
            //       final snackBar=SnackBar(
            //         content:Text(value.message),
            //         backgroundColor: Colors.red,
            //       );
            //       scaffoldKey.currentState.showSnackBar(snackBar);
            //     }
            //   }
            // });
            //
            // APIService apiService = new APIService();
            // apiService.login(loginRequestModel).then((value) {
            //   if (value != null) {
            //     setState(() {
            //       isApiCallProcess = false;
            //     });
            //
            //     if (value.token.isNotEmpty) {
            //       final snackBar = SnackBar(
            //           content: Text("Login Successful"));
            //       scaffoldKey.currentState
            //           .showSnackBar(snackBar);
            //     } else {
            //       final snackBar =
            //       SnackBar(content: Text(value.error));
            //       scaffoldKey.currentState
            //           .showSnackBar(snackBar);
            //     }
            //   }
            // });
          }
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => HomePage(),
          //     ));
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
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

  Widget _buildSignInWithText() {
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
          'Sign in with',
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

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(),)),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an Account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }



  @override
  void initState() {
    super.initState();
    loginRequestModel = new LoginRequestModel();
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
  // Widget _submitButton() {
  //   return Container(
  //     height: 55,
  //     width: 360,
  //     decoration: BoxDecoration(
  //         borderRadius: BorderRadius.all(Radius.circular(5)),
  //         gradient: LinearGradient(
  //             begin: Alignment.centerLeft,
  //             end: Alignment.centerRight,
  //             colors: [Colors.teal[500], Colors.teal[300]])),
  //     child: FlatButton(
  //       child: Text(
  //         "Log in",
  //         style: GoogleFonts.poppins(
  //           color: white,
  //           fontSize: 19,
  //         ),
  //       ),
  //       onPressed: () {
  //         if (validateAndSave()) {
  //           print(loginRequestModel.toJson());
  //           setState(() {
  //             isApiCallProcess = true;
  //           });
  //           LoginService apiService = new LoginService();
  //           apiService.login(loginRequestModel).then((value) {
  //             print(value.toString() + " is the value");
  //             if(value !=null){
  //               print("the response is "+value.message);
  //               setState(() {
  //                 isApiCallProcess=false;
  //
  //               });
  //               if(value.id.isNotEmpty){
  //                 final snackBar=SnackBar(
  //                   content:Text("Login Successful"),
  //                   backgroundColor: Colors.green,
  //                 );
  //                 scaffoldKey.currentState.showSnackBar(snackBar);
  //                 SharedService.setLoginDetails(value);
  //                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
  //               }else{
  //                 final snackBar=SnackBar(
  //                   content:Text(value.message),
  //                   backgroundColor: Colors.red,
  //                 );
  //                 scaffoldKey.currentState.showSnackBar(snackBar);
  //               }
  //             }
  //           });
  //           //
  //           // APIService apiService = new APIService();
  //           // apiService.login(loginRequestModel).then((value) {
  //           //   if (value != null) {
  //           //     setState(() {
  //           //       isApiCallProcess = false;
  //           //     });
  //           //
  //           //     if (value.id.isNotEmpty) {
  //           //       final snackBar = SnackBar(
  //           //           content: Text("Login Successful"));
  //           //       scaffoldKey.currentState
  //           //           .showSnackBar(snackBar);
  //           //     } else {
  //           //       final snackBar =
  //           //       SnackBar(content: Text(value.error));
  //           //       scaffoldKey.currentState
  //           //           .showSnackBar(snackBar);
  //           //     }
  //           //   }
  //           // });
  //         }
  //
  //       },
  //     ),
  //   );
  // }
  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('or',style: GoogleFonts.poppins(
            color: Colors.grey,
          ),),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
  Widget _facebookButton() {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 10),
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
                  "Log in with facebook",
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
      margin: EdgeInsets.symmetric(vertical: 5),
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
                  "Log in with google",
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
  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600,
                color: Colors.grey[700],),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Create account.',
              style: TextStyle(
                  color: Colors.teal,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
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
              style: TextStyle(color: Colors.teal[400], fontSize: 30),
            ),
          ]),
    );
  }
  final auth = FirebaseAuth.instance;
  Future<void> signIn(String email,String password)async{
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password).then((_) {

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
        print("firebase logged in successfully <3\nemail : ${auth.currentUser.email}");
      } );
    }on FirebaseAuthException catch (e){
      print(e.message);
    }
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        key: scaffoldKey,
        body: !isApiCallProcess?Container(
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
                height: double.infinity,
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,),
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _title(),
                        SizedBox(height: 30.0),
                        _buildEmailTF(),
                        SizedBox(
                          height: 30.0,
                        ),
                        _buildPasswordTF(),
                        _buildForgotPasswordBtn(),
                        _buildRememberMeCheckbox(),
                        _buildLoginBtn(),
                        _buildSignInWithText(),
                        _buildSocialBtnRow(),
                        _buildSignupBtn(),
                      ],
                    ),
                  ),
                ),
              ),
              // Positioned(top: 40, left: 0, child: _backButton()),
            ],
          ),
        ):Container(
          color: Colors.grey.withOpacity(0.1),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        )
    );
  }
}







// import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:roommates/APIServices/login_model.dart';
// import 'package:roommates/APIServices/login_service.dart';
// import 'package:roommates/APIServices/shared_service.dart';
// import 'package:roommates/HomePackage/HomePage.dart';
// import 'package:roommates/login_package/constants.dart';
// import 'package:roommates/theme/colors.dart';
// import '../signup_package/signup.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../src/Widget/bezierContainer.dart';
//
// class LoginPage extends StatefulWidget {
//   LoginPage({Key key, this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   LoginRequestModel loginRequestModel;
//   getPostsTest()async{
//
//   }
//   bool isApiCallProcess = false;
//   bool hidePassword=true;
//   String email;
//   String password;
//   GlobalKey<FormState>_formKey =GlobalKey<FormState>();
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//
//   bool _rememberMe = false;
//
//   Widget _buildEmailTF() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           'Email',
//           style: kLabelStyle,
//         ),
//         SizedBox(height: 10.0),
//         Container(
//           alignment: Alignment.centerLeft,
//           decoration: kBoxDecorationStyle,
//           height: 60.0,
//           child: TextFormField(
//             initialValue: "eve.holt@reqres.in",
//             keyboardType: TextInputType.emailAddress,
//             onSaved: (input) {
//
//               loginRequestModel.email = input;
//               email=input;
//             }
//             ,
//             validator: (input) => !input.contains('@')
//                 ? "Email Id should be valid"
//                 : null,
//             style: TextStyle(
//               color: Colors.white,
//               fontFamily: 'OpenSans',
//             ),
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.only(top: 14.0),
//               prefixIcon: Icon(
//                 Icons.email,
//                 color: Colors.white,
//               ),
//               hintText: 'Enter your Email',
//               hintStyle: kHintTextStyle,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildPasswordTF() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           'Password',
//           style: kLabelStyle,
//         ),
//         SizedBox(height: 10.0),
//         Container(
//           alignment: Alignment.centerLeft,
//           decoration: kBoxDecorationStyle,
//           height: 60.0,
//           child: TextFormField(
//             initialValue: "cityslicka",
//             keyboardType: TextInputType.text,
//             onSaved: (input) {
//
//             loginRequestModel.password = input;
//             password= input;
//
//              },
//             validator: (input) => input.length < 3
//                 ? "Password should be more than 3 characters"
//                 : null,
//             obscureText: hidePassword,
//             style: TextStyle(
//               color: Colors.white,
//               fontFamily: 'OpenSans',
//             ),
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.only(top: 14.0),
//               prefixIcon: Icon(
//                 Icons.lock,
//                 color: Colors.white,
//               ),
//               suffixIcon: IconButton(
//                 onPressed: () {
//                   setState(() {
//                     hidePassword = !hidePassword;
//                   });
//                 },
//                 color: Theme.of(context)
//                     .accentColor
//                     .withOpacity(0.4),
//                 icon: Icon(hidePassword
//                     ? Icons.visibility_off
//                     : Icons.visibility),
//               ),
//               hintText: 'Enter your Password',
//               hintStyle: kHintTextStyle,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildForgotPasswordBtn() {
//     return Container(
//       alignment: Alignment.centerRight,
//       child: FlatButton(
//         onPressed: () => print('Forgot Password Button Pressed'),
//         padding: EdgeInsets.only(right: 0.0),
//         child: Text(
//           'Forgot Password?',
//           style: kLabelStyle,
//         ),
//       ),
//     );
//   }
//
//   Widget _buildRememberMeCheckbox() {
//     return Container(
//       height: 20.0,
//       child: Row(
//         children: <Widget>[
//           Theme(
//             data: ThemeData(unselectedWidgetColor: Colors.white),
//             child: Checkbox(
//               value: _rememberMe,
//               checkColor: Colors.green,
//               activeColor: Colors.white,
//               onChanged: (value) {
//                 setState(() {
//                   _rememberMe = value;
//                 });
//               },
//             ),
//           ),
//           Text(
//             'Remember me',
//             style: kLabelStyle,
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildLoginBtn() {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 25.0),
//       width: double.infinity,
//       child: RaisedButton(
//         elevation: 5.0,
//         onPressed: () {
//           if (validateAndSave()) {
//             print(loginRequestModel.toJson());
//             LoginService apiService = new LoginService();
//             apiService.login(email,password).then((value) {
//
//               if(value !=null){
//                 print("the response is "+value.id);
//                 print("the error is "+ value.message);
//
//                 if(value.id.isNotEmpty){
//                   // final snackBar=SnackBar(
//                   //   content:Text("Login Successful"),
//                   //   backgroundColor: Colors.green,
//                   // );
//                   // scaffoldKey.currentState.showSnackBar(snackBar);
//                   //SharedService.setLoginDetails(value);
//                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
//                 }else{
//                   // final snackBar=SnackBar(
//                   //   content:Text(value.message),
//                   //   backgroundColor: Colors.red,
//                   // );
//                   // scaffoldKey.currentState.showSnackBar(snackBar);
//                 }
//               }
//             });
//             //
//             // APIService apiService = new APIService();
//             // apiService.login(loginRequestModel).then((value) {
//             //   if (value != null) {
//             //     setState(() {
//             //       isApiCallProcess = false;
//             //     });
//             //
//             //     if (value.token.isNotEmpty) {
//             //       final snackBar = SnackBar(
//             //           content: Text("Login Successful"));
//             //       scaffoldKey.currentState
//             //           .showSnackBar(snackBar);
//             //     } else {
//             //       final snackBar =
//             //       SnackBar(content: Text(value.error));
//             //       scaffoldKey.currentState
//             //           .showSnackBar(snackBar);
//             //     }
//             //   }
//             // });
//           }
//
//         },
//         padding: EdgeInsets.all(15.0),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30.0),
//         ),
//         color: Colors.white,
//         child: Text(
//           'LOGIN',
//           style: TextStyle(
//             color: Color(0xFF419890),
//             letterSpacing: 1.5,
//             fontSize: 18.0,
//             fontWeight: FontWeight.bold,
//             fontFamily: 'OpenSans',
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSignInWithText() {
//     return Column(
//       children: <Widget>[
//         Text(
//           '- OR -',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//         SizedBox(height: 20.0),
//         Text(
//           'Sign in with',
//           style: kLabelStyle,
//         ),
//       ],
//     );
//   }
//
//   Widget _buildSocialBtn(Function onTap, AssetImage logo) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: 60.0,
//         width: 60.0,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black26,
//               offset: Offset(0, 2),
//               blurRadius: 6.0,
//             ),
//           ],
//           image: DecorationImage(
//             image: logo,
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSocialBtnRow() {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 30.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           _buildSocialBtn(
//                 () => print('Login with Facebook'),
//             AssetImage(
//               'assets/logos/facebook.jpg',
//             ),
//           ),
//           _buildSocialBtn(
//                 () => print('Login with Google'),
//             AssetImage(
//               'assets/logos/google.jpg',
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSignupBtn() {
//     return GestureDetector(
//       onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(),)),
//       child: RichText(
//         text: TextSpan(
//           children: [
//             TextSpan(
//               text: 'Don\'t have an Account? ',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//             TextSpan(
//               text: 'Sign Up',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//
//
//   @override
//   void initState() {
//     super.initState();
//     loginRequestModel = new LoginRequestModel();
//   }
//   Widget _backButton() {
//     return InkWell(
//       onTap: () {
//         Navigator.pop(context);
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 10),
//         child: Row(
//           children: <Widget>[
//             Container(
//               padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
//               child: Icon(Icons.arrow_back_ios, color: Colors.white),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   Widget _submitButton() {
//     return Container(
//       height: 55,
//       width: 360,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(5)),
//           gradient: LinearGradient(
//               begin: Alignment.centerLeft,
//               end: Alignment.centerRight,
//               colors: [Colors.teal[500], Colors.teal[300]])),
//       child: FlatButton(
//         child: Text(
//           "Log in",
//           style: GoogleFonts.poppins(
//             color: white,
//             fontSize: 19,
//           ),
//         ),
//         onPressed: () {
//           // if (validateAndSave()) {
//           //   print(loginRequestModel.toJson());
//           //   setState(() {
//           //     isApiCallProcess = true;
//           //   });
//           //   LoginService apiService = new LoginService();
//           //   apiService.login(loginRequestModel).then((value) {
//           //     if(value !=null){
//           //       print("the response is "+value.id);
//           //       setState(() {
//           //         isApiCallProcess=false;
//           //
//           //       });
//           //       if(value.id.isNotEmpty){
//           //         final snackBar=SnackBar(
//           //           content:Text("Login Successful"),
//           //           backgroundColor: Colors.green,
//           //         );
//           //         scaffoldKey.currentState.showSnackBar(snackBar);
//           //         //SharedService.setLoginDetails(value);
//           //         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
//           //       }else{
//           //         final snackBar=SnackBar(
//           //           content:Text(value.message),
//           //           backgroundColor: Colors.red,
//           //         );
//           //         scaffoldKey.currentState.showSnackBar(snackBar);
//           //       }
//           //     }
//           //   });
//           //   //
//           //   // APIService apiService = new APIService();
//           //   // apiService.login(loginRequestModel).then((value) {
//           //   //   if (value != null) {
//           //   //     setState(() {
//           //   //       isApiCallProcess = false;
//           //   //     });
//           //   //
//           //   //     if (value.token.isNotEmpty) {
//           //   //       final snackBar = SnackBar(
//           //   //           content: Text("Login Successful"));
//           //   //       scaffoldKey.currentState
//           //   //           .showSnackBar(snackBar);
//           //   //     } else {
//           //   //       final snackBar =
//           //   //       SnackBar(content: Text(value.error));
//           //   //       scaffoldKey.currentState
//           //   //           .showSnackBar(snackBar);
//           //   //     }
//           //   //   }
//           //   // });
//           // }
//
//         },
//       ),
//     );
//   }
//   bool validateAndSave() {
//     final form = _formKey.currentState;
//     if (form.validate()) {
//       form.save();
//       return true;
//     }
//     return false;
//   }
//   Widget _divider() {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10),
//       child: Row(
//         children: <Widget>[
//           SizedBox(
//             width: 20,
//           ),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10),
//               child: Divider(
//                 thickness: 1,
//               ),
//             ),
//           ),
//           Text('or',style: GoogleFonts.poppins(
//             color: Colors.grey,
//           ),),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10),
//               child: Divider(
//                 thickness: 1,
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 20,
//           ),
//         ],
//       ),
//     );
//   }
//   Widget _facebookButton() {
//     return Container(
//       height: 50,
//       margin: EdgeInsets.symmetric(vertical: 10),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(10)),
//       ),
//       child: Row(
//         children: <Widget>[
//           Expanded(
//             flex: 1,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Color(0xff1959a9),
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(5),
//                     topLeft: Radius.circular(5)),
//               ),
//               alignment: Alignment.center,
//               child: Text('f',
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold)),
//             ),
//           ),
//           Expanded(
//             flex: 5,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Color(0xff2872ba),
//                 borderRadius: BorderRadius.only(
//                     bottomRight: Radius.circular(5),
//                     topRight: Radius.circular(5)),
//               ),
//               child: FlatButton(
//                 child: Text(
//                   "Log in with facebook",
//                   style: GoogleFonts.poppins(
//                     color: Colors.white,
//                     fontSize: 19,
//                     fontWeight: FontWeight.normal,
//                   ),
//                 ),
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => LoginPage(),
//                       ));
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//   Widget _googleButton() {
//     return Container(
//       height: 50,
//       margin: EdgeInsets.symmetric(vertical: 5),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(10)),
//       ),
//       child: Row(
//         children: <Widget>[
//           Expanded(
//             flex: 1,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.red,
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(5),
//                     topLeft: Radius.circular(5)),
//               ),
//               alignment: Alignment.center,
//               child: Text('G+',
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold)),
//             ),
//           ),
//           Expanded(
//             flex: 5,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.redAccent,
//                 borderRadius: BorderRadius.only(
//                     bottomRight: Radius.circular(5),
//                     topRight: Radius.circular(5)),
//               ),
//               child: FlatButton(
//                 child: Text(
//                   "Log in with google",
//                   style: GoogleFonts.poppins(
//                     color: Colors.white,
//                     fontSize: 19,
//                     fontWeight: FontWeight.normal,
//                   ),
//                 ),
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => LoginPage(),
//                       ));
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//   Widget _createAccountLabel() {
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => SignUpPage()));
//       },
//       child: Container(
//         margin: EdgeInsets.symmetric(vertical: 20),
//         padding: EdgeInsets.all(15),
//         alignment: Alignment.bottomCenter,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Don\'t have an account ?',
//               style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600,
//                 color: Colors.grey[700],),
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             Text(
//               'Create account.',
//               style: TextStyle(
//                   color: Colors.teal,
//                   fontSize: 13,
//                   fontWeight: FontWeight.w600),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   Widget _title() {
//     return RichText(
//       textAlign: TextAlign.center,
//       text: TextSpan(
//           text: 'Room',
//           style: GoogleFonts.portLligatSans(
//             textStyle: Theme.of(context).textTheme.display1,
//             fontSize: 30,
//             fontWeight: FontWeight.w700,
//             color: Colors.white,
//           ),
//           children: [
//             TextSpan(
//               text: 'mates',
//               style: TextStyle(color: Colors.teal[400], fontSize: 30),
//             ),
//           ]),
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     return Scaffold(
//         key: scaffoldKey,
//         body: !isApiCallProcess?Container(
//           height: height,
//           child: Stack(
//             children: <Widget>[
//               Container(
//                 height: double.infinity,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                       Color(0xFF47CABD),
//                       Color(0xFF2ACFBF),
//                       Color(0xFF0CB8A8),
//                       Color(0xFF009688),
//                     ],
//                     stops: [0.1, 0.4, 0.7, 0.9],
//                   ),
//                 ),
//               ),
//               Container(
//                 height: double.infinity,
//                 child: SingleChildScrollView(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 40.0,
//                     vertical: 120.0,),
//                   physics: AlwaysScrollableScrollPhysics(),
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         _title(),
//                         SizedBox(height: 30.0),
//                         _buildEmailTF(),
//                         SizedBox(
//                           height: 30.0,
//                         ),
//                         _buildPasswordTF(),
//                         _buildForgotPasswordBtn(),
//                         _buildRememberMeCheckbox(),
//                         _buildLoginBtn(),
//                         _buildSignInWithText(),
//                         _buildSocialBtnRow(),
//                         _buildSignupBtn(),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               // Positioned(top: 40, left: 0, child: _backButton()),
//             ],
//           ),
//         ):Container(
//           color: Colors.grey.withOpacity(0.1),
//           child: Center(
//             child: CircularProgressIndicator(),
//           ),
//         )
//     );
//   }
// }