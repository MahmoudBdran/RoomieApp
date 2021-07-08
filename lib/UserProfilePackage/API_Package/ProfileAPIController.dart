import 'dart:convert';

import 'package:roommates/UserProfilePackage/API_Package/profile_model.dart';
import 'package:http/http.dart' as http;

class ProfileAPIController{
  static Future<ProfileModel> getProfileData()async{
    String url="i'll type api url here";
    var response = await http.get(Uri.parse(url));
    if(response.statusCode==200){
      return ProfileModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception("Failed to load Data");
    }
  }
}