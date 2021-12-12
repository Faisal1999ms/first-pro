import 'dart:convert';
import 'dart:io';

import 'package:fluteer_grad_app/model/articl_model.dart';
import 'package:fluteer_grad_app/model/articls-model.dart';
import 'package:http/http.dart' as http;

class NewsApi {
  final String Apikey = "e37457f0573b467fa1e9357a368b10f4";
  Future<List<Article>> fetchArticles() async {
    try {
      http.Response response = await http.get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=eg&apiKey=$Apikey'));
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        Articleslist articles = Articleslist.fromJson(jsonData);
        List<Article> articleList =
            articles.articles.map((e) => Article.fromJson(e)).toList();
        return articleList;
      } else {
        print("${response.statusCode}");
      }
    } catch (ex) {
      print(ex);
    }
  }

  Future<List<Article>> fetchArticlesByCategory(String category) async {
    try {
      http.Response response = await http.get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=$Apikey'));
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        Articleslist articles = Articleslist.fromJson(jsonData);
        List<Article> articleList =
            articles.articles.map((e) => Article.fromJson(e)).toList();
        return articleList;
      } else {
        print("${response.statusCode}");
      }
    } catch (ex) {
      print(ex);
    }
  }
}
