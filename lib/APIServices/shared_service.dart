import 'dart:convert';
import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

import 'login_model.dart';

class SharedService{
  // static Future <bool> isLoggedIn() async{
  //   final prefs=await SharedPreferences.getInstance();
  //
  //   return prefs.getString("login_data") !=null ? true:false;
  // }
  // static Future<void> setLoginDetails(LoginResponeModel model)async{
  //   final prefs= await SharedPreferences.getInstance();
  //   prefs.setString("login_data", model !=null ? jsonEncode(model.toJson()):null);
  // }
  // static Future<void>logout()async{
  //   await setLoginDetails(null);
  // }
  // static Future<void> setMapDetails(String address ,double latitude,double longtude)async{
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setString("map_address", address!=null?address:"no");
  //   prefs.setDouble("map_address_latitude", latitude!=0?latitude:0);
  //   prefs.setDouble("map_address_longtude", longtude!=0?longtude:0);
  // }
  // static Future<List> getMapDetails()async{
  //   final prefs = await SharedPreferences.getInstance();
  //   List addressData=[prefs.getString("map_address"),prefs.getDouble("map_address_latitude"),prefs.getDouble("map_address_longtude")];
  //   return addressData;
  // }

}