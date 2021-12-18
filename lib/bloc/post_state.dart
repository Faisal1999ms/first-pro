part of 'post_bloc.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {}

class postLoading extends PostState {}

class postLoaded extends PostState {
  final List<Post> posts;
  postLoaded(this.posts);
}

class posterror extends PostState {
  String message;
  posterror(this.message);
}
