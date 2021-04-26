class UserModel {
  final String id;
  final String email;
  final String name;

  UserModel({this.id, this.email, this.name});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return new UserModel(
      id: json['id'].toString(),
      email: json['email'].toString(),
      name: json['name'].toString(),
    );
  }
}
