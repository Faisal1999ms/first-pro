import 'package:fluteer_grad_app/model/articl_model.dart';

class Articleslist {
  final List<dynamic> articles;

  Articleslist({this.articles});

  factory Articleslist.fromJson(Map<String, dynamic> jsonData) {
    return Articleslist(
      articles: jsonData['articles'],
    );
  }
}
