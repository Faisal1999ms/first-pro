import 'package:fluteer_grad_app/data/post.dart';
import 'package:fluteer_grad_app/repository/post_repository.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:provider/provider.dart';
import 'bloc/post_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => PostBloc(post_repositoryImpl())..add(Fetchpost()),
        child: Home2(),
      ),
    );
  }
}

class Home2 extends StatefulWidget {
  const Home2({Key key}) : super(key: key);

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  Future<List<Post>> aw;
  @override
  void initState() {
    setState(() {
      aw = post_repositoryImpl().getallpost();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Bloc"),
        ),
        body: FutureBuilder<List<Post>>(
          future: aw,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, i) {
                    return Card(
                      child: ListTile(
                        title: Text(snapshot.data[i].title),
                        subtitle: Text(snapshot.data[i].id.toString()),
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
      );
}

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc"),
      ),
      body: Center(
        child: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
          if (state is postLoading) {
            return CircularProgressIndicator();
          } else if (state is postLoaded) {
            return Container(
              width: double.infinity,
              height: 50,
              child: ListTile(
                title: Text(
                  state.posts[0].title,
                  style: TextStyle(color: Colors.black),
                ),
                subtitle: Text(state.posts[0].id.toString()),
              ),
            )
                // ListView.builder(
                //     itemCount: state.posts.length,
                //     itemBuilder: (context, i) {
                //       return Container(
                //         height: 40,
                //         width: double.infinity,
                //         child: ListTile(
                //           title: Text(
                //             state.posts[i].title,
                //             style: TextStyle(color: Colors.black),
                //           ),
                //           subtitle: Text(state.posts[i].id.toString()),
                //         ),
                //       );
                //     })
                ;
          } else if (state is posterror) {
            return Text("I am soray ");
          } else {
            return Text("data");
          }
        }),
      ),
    );
  }
}
