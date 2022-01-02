import 'dart:js';

import 'package:fluteer_grad_app/pages/stories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/news_data.dart';

// void main() {
//   runApp(myApp());
// }
// void main() {
//   runApp(ChangeNotifierProvider(
//     create: (_) => NewsData(),
//     child: myApp(),
//   ));
// }
void main() {
  runApp(MultiProvider(
    providers: [
      Provider<NewsData>(create: (_) => NewsData()),
    ],
    child: myApp(),
  ));
}

class myApp extends StatelessWidget {
  const myApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ChangeNotifierProvider<NewsData>(
      create: (BuildContext context) => NewsData(),
      builder: (context, child) {
        return StoriesPage();
      },
    ));
  }
}
