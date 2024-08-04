import 'package:es3_proj/app/models/category_model.dart';
import 'package:es3_proj/app/repositories/categories/categories_repository.dart';

class CategoriesRepositoryMemory implements CategoriesRepository {
  List<String> categories = [
    "Ação",
    "Aventura",
    "Comédia",
    "Drama",
    "Fantasia",
    "Ficção Científica",
    "Horror",
    "Musical",
    "Romance",
    "Suspense",
    "Western"
  ];

  @override
  Future<List<Category>> findAll() async {
    List<Category> listCategories = categories.map<Category>((cat) {
      return Category(id: categories.indexOf(cat), name: cat);
    }).toList();
    return listCategories;
  }
}
