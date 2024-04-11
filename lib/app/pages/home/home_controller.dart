import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:es3_proj/app/repositories/books/books_repository.dart';

import 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  final BooksRepository _booksRepository;
  HomeController(this._booksRepository) : super(const HomeState.initial());

  Future<void> loadProducts() async {
    try {
      emit(state.copyWith(status: HomeStateStatus.loading));
      final books = await _booksRepository.findAllBooks();
      emit(state.copyWith(status: HomeStateStatus.loaded, books: books));
    } catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      emit(state.copyWith(
          status: HomeStateStatus.error,
          errorMessage: 'Erro ao buscar produtos'));
    }
  }
}
