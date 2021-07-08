import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ProfileModel{
  final int user_id;
  final String username;
  final String email;
  final String profileCoverImage;
  final String profile_image;
  final String work;
  final String work_at;
  final String live_in;
  final String from;
  final String study;
  final String study_at;

  ProfileModel(
      {@required this.user_id,
        @required this.username,
        @required this.email,
        @required this.profileCoverImage,
        @required this.profile_image,
        @required this.work,
        @required this.work_at,
        @required this.live_in,
        @required this.from,
        @required this.study,
        @required this.study_at});
  factory ProfileModel.fromJson(Map<String , dynamic> map){
    return ProfileModel(
      user_id: map['user_id'],
      username: map['username'],
      email: map['email'],
      profileCoverImage: map['profileCoverImage'],
      profile_image: map['profile_image'],
      work: map['work'],
      work_at: map['work_at'],
      live_in: map['live_in'],
      from: map['from'],
      study: map['study'],
      study_at: map['study_at'],
    );
  }
}