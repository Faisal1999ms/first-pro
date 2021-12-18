import 'package:bloc/bloc.dart';
import 'package:fluteer_grad_app/data/post.dart';
import 'package:fluteer_grad_app/repository/post_repository.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final postRepository repository;
  PostBloc(this.repository) : super(PostInitial()) {
    @override
    Stream<PostState> mapEventToState(PostEvent event) async* {
      if (event is Fetchpost) {
        yield postLoading();
        try {
          final posts = await repository.getallpost();
          yield postLoaded(posts);
        } catch (e) {
          yield posterror(e.toString());
        }
      }
    }

    // on<PostEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
  }
}
