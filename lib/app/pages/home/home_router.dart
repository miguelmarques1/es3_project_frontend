import 'package:es3_proj/app/pages/home/home_controller.dart';
import 'package:es3_proj/app/repositories/books/i_books_repository.dart';
import 'package:es3_proj/app/repositories/books/books_repository_memory.dart';
import 'package:es3_proj/app/repositories/categories/categories_repository.dart';
import 'package:es3_proj/app/repositories/categories/categories_repository_memory.dart';
import 'package:es3_proj/app/repositories/precification_groups/precification_groups_repository_memory.dart';
import 'package:es3_proj/app/repositories/precification_groups/precificaton_groups_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';

class HomeRouter {
  HomeRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<IBooksRepository>(
            create: (context) => BooksRepositoryMemory(),
          ),
          Provider<CategoriesRepository>(
            create: (context) => CategoriesRepositoryMemory(),
          ),
          Provider<PrecificationGroupsRepository>(
            create: (context) => PrecificationGroupsRepositoryMemory(),
          ),
          Provider(
            create: (context) => HomeController(
              context.read<IBooksRepository>(),
              context.read<CategoriesRepository>(),
              context.read<PrecificationGroupsRepository>(),
            ),
          )
        ],
        child: const HomePage(),
      );
}
