import 'package:fluteer_grad_app/model/articl_model.dart';
import 'package:fluteer_grad_app/model/articls-model.dart';
import 'package:fluteer_grad_app/servies/news-servies.dart';
import 'package:flutter/cupertino.dart';

class ArticleListViewModel extends ChangeNotifier {
  List<Article> _articleList = [];
  List<Article> _articleListByCategory = [];
  Future<void> fetchArticles() async {
    _articleList = await NewsApi().fetchArticles();
    notifyListeners();
  }

  Future<void> fetchArticlesBycategory(String category) async {
    _articleListByCategory = await NewsApi().fetchArticlesByCategory(category);
    notifyListeners();
  }

  List<Article> get articleslist => _articleList;
  List<Article> get articleslistbycategory => _articleListByCategory;
}
