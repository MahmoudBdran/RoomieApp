// class LoginResponeModel{
//   final String id;
//   final String message;
//   LoginResponeModel({this.id,this.message});
//   factory LoginResponeModel.fromJson(Map<String,dynamic> json){
//     return LoginResponeModel(
//         id: json['id']!=null?json['id']:"",
//         message:json['message']!=null?json['message']:"" );
//
//   }
//   Map<String,dynamic> toJson(){
//     Map<String,dynamic>map={
//       "id":id.trim(),
//       "message":message.trim()
//     };
//     return map;
//   }
//
//
// }
// class LoginRequestModel{
//   String email;
//   String password;
//   LoginRequestModel({this.email,this.password});
//   Map<String,dynamic> toJson(){
//     Map<String,dynamic> map ={
//       'email':email.trim(),
//       'password':password.trim()
//     };
//     return map;
//   }
// }
class LoginResponeModel{
  final String id;
  final String message;
  LoginResponeModel({this.id,this.message});
  factory LoginResponeModel.fromJson(Map<String,dynamic> json){
    return LoginResponeModel(
        id: json['id']!=null?json['id']:"",
        message:json['message']!=null?json['message']:"" );

  }
  Map<String,dynamic> toJson(){
    Map<String,dynamic>map={
      "id":id.trim(),
      "message":message.trim()
    };
    return map;
  }


}
class LoginRequestModel{
  String email;
  String password;
  LoginRequestModel({this.email,this.password});
  Map<String,dynamic> toJson(){
    Map<String,dynamic> map ={
      'email':email.trim(),
      'password':password.trim()
    };
    return map;
  }
}