import 'dart:convert';

import 'package:fluteer_grad_app/data/post.dart';
import 'package:http/http.dart';

abstract class postRepository {
  Future<List<Post>> getallpost() {}
}

class post_repositoryImpl extends postRepository {
  @override
  Future<List<Post>> getallpost() async {
    final respons =
        await get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (respons.statusCode == 200) {
      final parsed = json.decode(respons.body).cast<Map<String, dynamic>>();
      return parsed.map<Post>((item) => Post.fromJson(item)).tolist();
    } else {
      throw Exception("can not lod post");
    }
  }
}
