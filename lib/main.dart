import 'package:fluteer_grad_app/Views/screen_view.dart';
import 'package:fluteer_grad_app/servies/news-servies.dart';
import 'package:fluteer_grad_app/views_model/LOA-view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ArticleListViewModel>(
      create: (context) => ArticleListViewModel(),
      child: MaterialApp(
        title: 'News Cloude',
        home: HomeView(),
      ),
    );
  }
}
