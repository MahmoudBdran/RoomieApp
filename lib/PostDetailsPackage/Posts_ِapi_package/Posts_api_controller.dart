import 'dart:convert';

import 'package:roommates/PostDetailsPackage/Posts_%D9%90api_package/PostsModel.dart';
import 'package:http/http.dart' as http;
class PostsAPIController{
  static List<PostsModel> posts=[];
  static Future<List<PostsModel>> getPosts()async{
    String url = "";
    var response = await http.get(Uri.parse(url));
    if(response.statusCode==200){
      for(var post in jsonDecode(response.body)){
        posts.add(new PostsModel(
          post_id: post['post_id'],
          email: post['email'],
          username: post['username'],
          address: post['address'],
          availability: post['availability'],
          avatar: post['avatar'],
          phone: post['phone'],
          description: post['description'],
          gender: post['gender'],
          guests:  post['guests'],
          images: post['images'],
          images_length: post['images_length'],
          likes_uid:  post['likes_uid'],
          people_type : post['people_type'],
          pets: post['pets'],
          price: post['price'],
          smoking:  post['smoking'],
          sub_address: post['sub_address'],
          time: post['time'],
          type: post['type'],
        ));
      }
      return posts;
    }else{
      throw Exception("failed to load");
    }
  }
}