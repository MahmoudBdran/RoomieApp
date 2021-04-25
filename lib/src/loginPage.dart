import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:roommates/APIServices/login_model.dart';
import 'package:roommates/APIServices/login_service.dart';
import 'package:roommates/APIServices/shared_service.dart';
import 'package:roommates/HomePackage/HomePage.dart';
import 'signup.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Widget/bezierContainer.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginRequestModel loginRequestModel;
  bool isApiCallProcess = false;
  bool hidePassword=true;
  GlobalKey<FormState>_formKey =GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
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
              child: Icon(Icons.arrow_back_ios, color: Colors.grey),
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
          "Log in",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 19,
          ),
        ),
        onPressed: () {
          if (validateAndSave()) {
            print(loginRequestModel.toJson());
            setState(() {
              isApiCallProcess = true;
            });
            LoginService apiService = new LoginService();
            apiService.login(loginRequestModel).then((value) {
              if(value !=null){
                print("the response is "+value.token);
                setState(() {
                  isApiCallProcess=false;

                });
                if(value.token.isNotEmpty){
                  final snackBar=SnackBar(
                    content:Text("Login Successful"),
                    backgroundColor: Colors.green,
                  );
                  scaffoldKey.currentState.showSnackBar(snackBar);
                  SharedService.setLoginDetails(value);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
                }else{
                  final snackBar=SnackBar(
                    content:Text(value.error),
                    backgroundColor: Colors.red,
                  );
                  scaffoldKey.currentState.showSnackBar(snackBar);
                }
              }
            });
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
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ));
        },
      ),
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
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: scaffoldKey,
        body: !isApiCallProcess?Container(
          height: height,
          child: Stack(
        children: <Widget>[
          Positioned(
              top: -height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer()),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .16),
                    _title(),
                    SizedBox(height: 40),
                    Container(

                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Email",
                            style: GoogleFonts.poppins(fontWeight: FontWeight.normal, fontSize: 15,
                              color: Colors.grey[500],),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              initialValue: "eve.holt@reqres.in",
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (input) =>
                              loginRequestModel.email = input,
                              validator: (input) => !input.contains('@')
                                  ? "Email Id should be valid"
                                  : null,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(EvaIcons.personOutline,color: Colors.teal,),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  fillColor: Color(0xfff3f3f4),
                                  filled: true))
                        ],
                      ),
                    ),
                    Container(

                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Password",
                            style: GoogleFonts.poppins(fontWeight: FontWeight.normal, fontSize: 15,
                              color: Colors.grey[500],),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            initialValue: "cityslicka",
                              keyboardType: TextInputType.text,
                              onSaved: (input) =>
                              loginRequestModel.password = input,
                              validator: (input) => input.length < 3
                                  ? "Password should be more than 3 characters"
                                  : null,
                              obscureText: hidePassword,
                              decoration: InputDecoration(
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
                                  prefixIcon: Icon(Icons.vpn_key,color:Colors.teal),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  fillColor: Color(0xfff3f3f4),
                                  filled: true))
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    _submitButton(),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.centerRight,
                      child: Text('Forgot Password ?',
                          style: TextStyle(
                            color: Colors.grey[700],
                              fontSize: 14, fontWeight: FontWeight.w500)),
                    ),
                    _divider(),
                    _facebookButton(),
                    _googleButton(),
                    SizedBox(height: height * .04),
                    _createAccountLabel(),
                  ],
                ),
              ),
            ),
          ),
          Positioned(top: 40, left: 0, child: _backButton()),
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
