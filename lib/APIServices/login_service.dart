import 'package:http/http.dart' as http;
import 'package:roommates/signup_package/API_package/signup_model.dart';
import 'dart:convert';

import 'login_model.dart';
class LoginService{
  // Future<LoginResponeModel> login(LoginRequestModel loginRequestModel) async{
  //   String url="https://roomie--app.herokuapp.com/user/signin";
  //   final response = await http.post(Uri.parse(url),body:loginRequestModel.toJson());
  //   if(response.statusCode==200 || response.statusCode==400){
  //     return LoginResponeModel.fromJson(json.decode(response.body));
  //   }else{
  //     throw Exception('faild to load data');
  //   }
  // }

  Future<LoginResponeModel> login(/* LoginRequestModel loginRequestModel*/
      String email,String password) async{
    Map<String,dynamic> map = {
      "email":email,
      "password":password
    };
  String url="https://roomie--app.herokuapp.com/user/signin";
  final response = await http.post(Uri.parse(url),body:/*loginRequestModel.toJson()*/map);
  if(response.statusCode==200 || response.statusCode==400){
  return LoginResponeModel.fromJson(json.decode(response.body));
  }else{
  throw Exception('faild to load data');
  }
  }

  Future<SignUpResponeModel> signUp(
      {String avatar, String email, String password})async{
    String url= "https://roomie--app.herokuapp.com/user/signup";
    final response = await http.post(Uri.parse(url),body:jsonEncode(<String,dynamic>{
        'email':email,
        'password':password,
        'avatar':avatar
    }),headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },);
    if(response.statusCode==201 ||response.statusCode==200||response.statusCode==400){
      return SignUpResponeModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception("failed to load data");
    }
  }


}