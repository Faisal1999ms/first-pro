import 'package:fluteer_grad_app/model/articl_model.dart';
import 'package:fluteer_grad_app/servies/news-servies.dart';
import 'package:fluteer_grad_app/views_model/LOA-view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<List<Article>> aw;
  @override
  void initState() {
    setState(() {
      aw = NewsApi().fetchArticles();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String mm;
    return Scaffold(
      body: FutureBuilder<List<Article>>(
        future: aw,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: 5,
                itemBuilder: (context, i) {
                  return Card(
                    child: ListTile(
                      title: Text(snapshot.data[i].titel),
                      // subtitle: Row(
                      //   children: <Widget>[
                      //     Text(snapshot.data[i].dascription),
                      //     SizedBox(
                      //       width: 100,
                      //     ),
                      //     Text('${snapshot.data[i].imageurl}'),
                      //   ],
                      // ),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            Text('Sorry there is an error');
          }
          return CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("kk"),
        onPressed: () async {
          await Provider.of<ArticleListViewModel>(context, listen: false)
              .fetchArticles();
          Provider.of<ArticleListViewModel>(context, listen: false)
              .articleslist;
        },
      ),
    );
  }
}
