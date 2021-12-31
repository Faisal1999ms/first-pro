import 'package:fluteer_grad_app/models/news_data.dart';
import 'package:fluteer_grad_app/models/news_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

class StoriesPage extends StatelessWidget {
  const StoriesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<NewsData>().fetchdata;
    return Scaffold(
      appBar: AppBar(
        title: Text("Stories"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await context.read<NewsData>().fetchdata;
        },
        child: Center(
          child: Consumer<NewsData>(
            builder: (context, value, child) {
              return value.map.length == 0 && !value.error
                  ? CircularProgressIndicator()
                  : value.error
                      ? Text(
                          "opps , somthig went wrong .${value.errormassage}",
                          textAlign: TextAlign.center,
                        )
                      : ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context, ind) {
                            return Newscard(ne: value.NewsDa[ind]);
                            // Text("data${value.map[ind]["id"]}");
                          });
            },
          ),
        ),
      ),
    );
  }
}

class Newscard extends StatelessWidget {
  Newscard({Key key, @required this.ne}) : super(key: key);
  // final Map<String, dynamic> map;
  News ne;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [Image.network(ne.thumbnailUrl), Text("id=${ne.id}")],
        ),
      ),
    );
  }
}
