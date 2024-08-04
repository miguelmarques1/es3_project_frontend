import 'package:es3_proj/app/models/category_model.dart';

abstract class CategoriesRepository {
  Future<List<Category>> findAll();
}
