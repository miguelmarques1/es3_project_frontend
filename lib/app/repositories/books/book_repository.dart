// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:es3_proj/app/core/exceptions/repository_exception.dart';
// import 'package:es3_proj/app/core/rest/dio/custom_dio.dart';
// import 'package:es3_proj/app/core/rest/rest_client.dart';
// import 'package:es3_proj/app/models/author_model.dart';
// import 'package:es3_proj/app/models/book_model.dart';
// import 'package:es3_proj/app/models/dimensions_model.dart';
// import 'package:es3_proj/app/models/group_pricing_model.dart';
// import 'package:es3_proj/app/repositories/books/i_books_repository.dart';

// class BooksRepository implements IBooksRepository {
//   final RestClient rest;

//   BooksRepository({
//     required this.rest,
//   });

//   @override
//   Future<List<Book>> findAllBooks() async {
//     try {
//       final response = await rest.get('/books');
//       return response.data.map<Book>((p) => Book.fromMap(p)).toList();
//     } on DioException catch (e, s) {
//       log('Erro ao buscar formas de pagamento', error: e, stackTrace: s);
//       throw RepositoryException(message: 'Erro ao buscar formas de pagamento');
//     }
//   }

//   @override
//   Future<Book> findBookById(int id) async {
//     await Future.delayed(const Duration(seconds: 2));
//     return books.firstWhere((book) => book.id == id);
//   }

//   @override
//   Future<bool> create(Book book) async {
//     await Future.delayed(const Duration(seconds: 2));
//     book.id = books.length;
//     books.add(book);
//     return true;
//   }
// }
