import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'news_model.dart';

class NewsData with ChangeNotifier {
  List<dynamic> _map = [];
  List<News> NewsDa;
  bool _error = false;
  String _errormassage = "";
  List<dynamic> get map => _map;
  bool get error => _error;
  String get errormassage => _errormassage;
  Future<void> get fetchdata async {
    final response =
        await get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    if (response.statusCode == 200) {
      try {
        _map = jsonDecode(response.body);
        _error = false;
        NewsDa = _map.map((e) => News.fromJson(e)).toList();
      } catch (e) {
        _error = true;
        _errormassage = e.toString();
        _map = [];
      }
    } else {
      _error = true;
      _errormassage = "it cold by yuor internet connection";
      _map = [];
    }
    notifyListeners();
  }

  void initialvalues() {
    _error = true;
    _errormassage = "";
    _map = [];
    notifyListeners();
  }
}
