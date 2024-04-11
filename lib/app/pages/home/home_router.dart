import 'package:es3_proj/app/pages/home/home_controller.dart';
import 'package:es3_proj/app/repositories/books/books_repository.dart';
import 'package:es3_proj/app/repositories/books/books_repository_memory.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';

class HomeRouter {
  HomeRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<BooksRepository>(
            create: (context) => BooksRepositoryMemory(),
          ),
          Provider(
            create: (context) => HomeController(
              context.read<BooksRepository>(),
            ),
          )
        ],
        child: const HomePage(),
      );
}
