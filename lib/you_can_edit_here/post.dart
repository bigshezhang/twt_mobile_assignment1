import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

// 请根据 json 数据里面的项目完善它
class Post {
  Post({
    required this.id,
    required this.nickname,
    required this.avatar,
    required this.image_urls,
    required this.created_at,
    required this.uid,
    required this.title,
    required this.content,
    required this.fav_count,
    required this.like_count,
  });

  int id;
  String nickname;
  String avatar;
  List<String> image_urls;
  String created_at;
  int uid;
  String title;
  String content;
  int fav_count;
  int like_count;


  bool operator ==(Object other) => other is Post && other.id == id;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        nickname: json["user_info"]["nickname"],
        avatar: json["user_info"]["avatar"],
        image_urls: List<String>.from(json["image_urls"]),
        created_at: json["created_at"],
        uid: json["uid"],
        title: json["title"],
        content: json["content"],
        fav_count: json["fav_count"],
        like_count: json["like_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
