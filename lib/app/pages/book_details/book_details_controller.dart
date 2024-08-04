import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:es3_proj/app/pages/book_details/book_details_state.dart';
import 'package:es3_proj/app/repositories/books/i_books_repository.dart';

class BookDetailsController extends Cubit<BookDetailsState> {
  final IBooksRepository _booksRepository;
  BookDetailsController(
    this._booksRepository,
  ) : super(const BookDetailsState.initial());

  void increment() {
    emit(
      state.copyWith(amount: state.amount + 1),
    );
  }

  void decrement() {
    if (state.amount != 1) {
      emit(
        state.copyWith(amount: state.amount - 1),
      );
    }
  }

  Future<void> loadBook(int bookId) async {
    try {
      emit(state.copyWith(status: BookDetailsStateStatus.loading));
      final book = await _booksRepository.findBookById(bookId);
      emit(state.copyWith(status: BookDetailsStateStatus.loaded, book: book));
    } catch (e, s) {
      log('Erro ao buscar livro', error: e, stackTrace: s);
      emit(state.copyWith(
        status: BookDetailsStateStatus.error,
        errorMessage: 'Erro ao buscar livro',
      ));
    }
  }
}
