import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/models/category.dart' as category_model;
import 'package:social_app/modules/repos/repos/list_categories_repo.dart';

class ListCategoresBloc extends Cubit<List<category_model.Category>?> {
  ListCategoresBloc() : super(null);

  Future<void> getCategories() async {
    try {
      final res = await ListCategoriesRepo().getCategories();
      if (res != null) {
        emit(res);
      }
    } catch (e) {
      debugPrint('error=$e');
      emit([]);
    }
  }
}
