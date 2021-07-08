import 'package:flutter/cupertino.dart';

class SignUpResponeModel{
  final String id;
  final String message;
  SignUpResponeModel({this.id,this.message});
  factory SignUpResponeModel.fromJson(Map<String,dynamic> json){
    return SignUpResponeModel(
        id: json['id'],
        message:json['message']);
  }
  Map<String,dynamic> toJson(){
    Map<String,dynamic>map={
      "id":id.trim(),
      "message":message.trim()
    };
    return map;
  }
}
class SignUpRequestModel{
   //String username;
   String email;
   String avatar;
    String password;
  // final String phone;
  // final String profileCoverImage;
  // final String profile_image;
  // final String work;
  // final String work_at;
  // final String live_in;
  // final String from;
  // final String study;
  // final String study_at;

  SignUpRequestModel(
      {
        //@required this.username,
        @required this.email,
        @required this.avatar,
         @required this.password,
        // @required this.phone,
        // @required this.profileCoverImage,
        // @required this.profile_image,
        // @required this.work,
        // @required this.work_at,
        // @required this.live_in,
        // @required this.from,
        // @required this.study,
        // @required this.study_at
      });

  Map<String,dynamic> toJson(){
    Map<String,dynamic> map ={
      //'username':username.trim(),
      'email':email.trim(),
      'avatar':avatar.trim(),
       'password':password.trim()
      // 'phone':phone.trim(),
      // 'profileCoverImage':profileCoverImage.trim(),
      // 'profile_image':profile_image.trim(),
      // 'work':work.trim(),
      // 'work_at':work_at.trim(),
      // 'live_in':live_in.trim(),
      // 'from':from.trim(),
      // 'study':study.trim(),
      // 'study_at':study_at.trim(),
    };
    return map;
  }
}