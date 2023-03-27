import 'package:social_app/modules/models/post.dart';
import 'package:social_app/modules/providers/bloc_provider.dart';
import 'package:social_app/modules/repos/repos/list_posts_repo.dart';
import 'package:rxdart/rxdart.dart';

class ListPostsBloc extends BlocBase {
  final _postsCtrl = BehaviorSubject<List<Post>?>();
  Stream<List<Post>?> get postsStream => _postsCtrl.stream;

  Future<void> getPosts() async {
    try {
      final res = await ListPostsRepo().getPosts();
      if (res != null) {
        _postsCtrl.sink.add(res);
      }
    } catch (e) {
      _postsCtrl.sink.addError('Cannot fetch list posts right now!!!');
    }
  }

  @override
  void dispose() {}
}