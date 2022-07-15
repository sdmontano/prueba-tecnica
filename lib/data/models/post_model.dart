import 'dart:convert';

class PostModel {
  String title;
  String body;
  int? id;
  int? userId;

  PostModel({required this.title, required this.body, this.id, this.userId
      //required this.artist,
      });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        title: json['title'],
        body: json['body'],
        id: json['id'],
        userId: json['userId']);
  }

  Map<String, dynamic> toJson() =>
      {'title': title, 'body': body, 'id': id, 'userId': userId};
}

List<PostModel> postModelFromJson(String str) =>
    List<PostModel>.from(json.decode(str).map((x) => PostModel.fromJson(x)));

String postModelToJson(List<PostModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
