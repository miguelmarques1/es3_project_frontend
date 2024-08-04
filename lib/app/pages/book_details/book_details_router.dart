import 'package:es3_proj/app/pages/book_details/book_details_controller.dart';
import 'package:es3_proj/app/pages/book_details/book_details_page.dart';
import 'package:es3_proj/app/repositories/books/i_books_repository.dart';
import 'package:es3_proj/app/repositories/books/books_repository_memory.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookDetailsRouter {
  BookDetailsRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<IBooksRepository>(
            create: (context) => BooksRepositoryMemory(),
          ),
          Provider(
            create: (context) => BookDetailsController(
              context.read<IBooksRepository>(),
            ),
          ),
        ],
        builder: (context, child) {
          final settings = ModalRoute.of(context)!.settings;
          final uri = Uri.parse(settings.name ?? "");
          final bookId = int.parse(uri.pathSegments[1]);

          return BookDetailsPage(
            bookId: bookId,
          );
        },
      );
}
