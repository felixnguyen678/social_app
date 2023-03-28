import 'package:social_app/modules/models/category.dart';
import 'package:social_app/modules/models/post.dart';
import 'package:social_app/modules/repos/repos/list_categories_repo.dart';
import 'package:social_app/providers/bloc_provider.dart';
import 'package:social_app/modules/repos/repos/list_posts_repo.dart';
import 'package:rxdart/rxdart.dart';

class ListCategoresBloc extends BlocBase {
  final _categoriesCtrl = BehaviorSubject<List<Category>?>();
  Stream<List<Category>?> get postsStream => _categoriesCtrl.stream;

  Future<void> getCategories() async {
    try {
      final res = await ListCategoriesRepo().getCategories();
      if (res != null) {
        _categoriesCtrl.sink.add(res);
      }
    } catch (e) {
      _categoriesCtrl.sink.addError('Cannot fetch list categories right now!!!');
    }
  }

  @override
  void dispose() {}
}