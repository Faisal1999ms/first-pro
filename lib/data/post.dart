class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({this.userId, this.id, this.title, this.body});

  Post.fromJson(Map<String, dynamic> json) {
    this.userId = json["userId"];
    this.id = json["id"];
    this.title = json["title"];
    this.body = json["body"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["userId"] = this.userId;
    data["id"] = this.id;
    data["title"] = this.title;
    data["body"] = this.body;
    return data;
  }
}
