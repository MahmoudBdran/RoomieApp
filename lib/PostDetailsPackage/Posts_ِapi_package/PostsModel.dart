class PostsModel{
  final String user_Id;
  final int post_id;
  final String email;
  final String username;
  final String avatar;
  final String phone;
  final String character;
  final String availability;
  final String price;
  final String type;
  final String pets;
  final String guests;
  final String smoking;
  final String gender;
  final String time;
  final String images_length;
  final List<String> images;
  final String description;
  final String address;
  final String sub_address;
  final List<String> likes_uid;

  PostsModel({this.user_Id,this.post_id, this.email, this.username, this.avatar, this.phone,
    this.character, this.availability, this.price, this.type, this.pets,
    this.guests, this.smoking, this.gender, this.time, this.images_length,
    this.images, this.description, this.address, this.sub_address, this.likes_uid});
  factory PostsModel.fromJson(Map<String ,dynamic>map){
    return PostsModel(

      post_id: map['post_id'],
        email: map['email'],
        character: map['character'],
        username: map['username'],
        avatar: map['avatar'],
        phone: map['phone'],
        availability: map['availability'],
        price: map['price'],
        type: map['type'],
        pets: map['pets'],
        guests: map['guests'],
        smoking: map['smoking'],
        gender: map['gender'],
        time: map['time'],
        images_length: map['images_length'],
        images: map['images'],
        description: map['description'],
        address: map['address'],
        sub_address: map['sub_address'],
        likes_uid: map['likes_uid']
    );
  }
}