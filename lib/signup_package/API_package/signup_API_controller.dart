import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:roommates/signup_package/API_package/signup_model.dart';
class SignUpAPIController
{
static Future<SignUpResponeModel> SignUp(
 String username,
 String email,
 String password,
 String phone,
 String profileCoverImage,
 String profile_image,
 String work,
 String work_at,
 String live_in,
 String from,
 String study,
 String study_at)async{
  String url="";
  var response = await http.post(Uri.parse(url), headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  },body:( <String ,dynamic>{
    'username': username,
    'email':email,
    'password': password,
    'phone':phone,
    'profileCoverImage': profileCoverImage,
    'profile_image':profile_image,
    'work': work,
    'work_at':work_at,
    'live_in': live_in,
    'from':from,
    'study': study,
    'study_at':study_at
  }));
  if(response.statusCode==200){
    return SignUpResponeModel.fromJson(jsonDecode(response.body));
  }else{
    throw Exception("Failed to load data");
  }
}
}