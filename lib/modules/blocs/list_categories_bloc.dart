import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/models/category.dart' as category_model;
import 'package:social_app/modules/repos/repos/list_categories_repo.dart';

class ListCategoriesBloc extends Bloc<String, ListCategoriesState> {
  // ListCategoresBloc() : super(null);

  // Future<void> getCategories() async {
  //   try {
  //     final res = await ListCategoriesRepo().getCategories();
  //     if (res != null) {
  //       emit(res);
  //     }
  //   } catch (e) {
  //     debugPrint('error=$e');
  //     emit([]);
  //   }
  // }

  ListCategoriesBloc() : super(ListCategoriesState()) {
    on<String>((event, emit) async {
      switch (event) {
        case 'getCategories':
          debugPrint('ahihi');
          try {
            final res = await ListCategoriesRepo().getCategories();
            debugPrint('$res');
            if (res != null) {
              emit(ListCategoriesState(categories: res));
            }
          } catch (e) {
            debugPrint('$e');
            emit(ListCategoriesState(error: e));
          }
          break;
      }
    });
  }
}

class ListCategoriesState {
  final Object? error;
  final List<category_model.Category>? categories;

  ListCategoriesState({
    this.error,
    this.categories,
  });
}
