import 'package:dio/dio.dart';
import 'package:social_app/constants/app_configs.dart';
import 'package:social_app/modules/models/category.dart';

class ListCategoriesRepo {
  Future<List<Category>?> getCategories () async {
    try {
      final res = await Dio(BaseOptions(baseUrl: AppConfigs.baseUrl)).get(
        "/v1/categories",
        queryParameters: {'tags': "portrait"},
        options: Options(method: 'get', headers: {
          "Content-Type": "application/json"
        }),
      );

      if(res.statusCode != 200){
        return null;
      }

      List data = res.data['data'];

      return data.map((json) => Category.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
