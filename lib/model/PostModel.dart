import 'package:streamfriendmatch/model/UserModel.dart';

class PostModel {
  final String id;
  final DateTime createdAt;
  final UserModel user;
  final String content;

  PostModel({this.id, this.createdAt, this.user, this.content});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return new PostModel(
      id: json['id'].toString(),
      user: UserModel.fromJson(json['user']),
      content: json['content'].toString(),
      createdAt: DateTime.parse(json['createdAt'].toString() + " 00:00:00Z"),
    );
  }
}
