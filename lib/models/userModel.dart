class User {
  int id;
  String name;
  String image;
  String user_phone;
  User();

  Map<String, dynamic> toJson() => {'id': id, 'name': name != null ? name : null, 'image': image != null ? image : null};

  User.fromJson(Map<String, dynamic> json) {
    try {
      id = json['id'] != null ? int.parse('${json['id']}') : null;
      name = json['name'] != null ? json['name'] : null;
      image = json['image'] != null ? json['image'] : null;
      user_phone = json['user_phone'] != null ? json['user_phone'] : null;

    
    } catch (e) {
      print("Exception - userModel.dart - User.fromJson():" + e.toString());
    }
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, image: $image, user_phone: $user_phone}';
  }
}
