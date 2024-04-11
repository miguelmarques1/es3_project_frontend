import 'package:es3_proj/app/models/book_model.dart';

abstract class BooksRepository {
  Future<List<Book>> findAllBooks();
}
