import 'package:es3_proj/app/models/book_model.dart';

abstract class IBooksRepository {
  Future<List<Book>> findAllBooks();
  Future<Book> findBookById(int bookId);
  Future<bool> create(Book book);
}
