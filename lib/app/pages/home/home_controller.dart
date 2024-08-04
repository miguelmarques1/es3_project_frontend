import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:es3_proj/app/models/book_model.dart';
import 'package:es3_proj/app/models/category_model.dart';
import 'package:es3_proj/app/models/group_pricing_model.dart';
import 'package:es3_proj/app/repositories/books/i_books_repository.dart';
import 'package:es3_proj/app/repositories/categories/categories_repository.dart';
import 'package:es3_proj/app/repositories/precification_groups/precificaton_groups_repository.dart';

import 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  final IBooksRepository _booksRepository;
  final CategoriesRepository _categoriesRepository;
  final PrecificationGroupsRepository _precificationGroupsRepository;
  HomeController(
    this._booksRepository,
    this._categoriesRepository,
    this._precificationGroupsRepository,
  ) : super(const HomeState.initial());

  Future<void> loadData() async {
    try {
      emit(state.copyWith(status: HomeStateStatus.loading));
      final books = await _booksRepository.findAllBooks();
      final categories = await _getCategories();
      final precificationGroups = await _getPrecificationGroups();
      emit(state.copyWith(
        status: HomeStateStatus.loaded,
        categories: categories,
        precificationGroups: precificationGroups,
        books: books,
      ));
    } catch (e, s) {
      log('Erro ao buscar livros', error: e, stackTrace: s);
      emit(state.copyWith(
          status: HomeStateStatus.error,
          errorMessage: 'Erro ao buscar livros'));
    }
  }

  Future<void> createBook(Book book) async {
    try {
      emit(state.copyWith(status: HomeStateStatus.loading));
      await _booksRepository.create(book);
      loadData();
    } catch (e, s) {
      log('Erro ao criar livro', error: e, stackTrace: s);
      emit(
        state.copyWith(
          status: HomeStateStatus.error,
          errorMessage:
              'Erro ao criar livro. Por favor, tente novamente mais tarde.',
        ),
      );
    }
  }

  Future<List<Category>> _getCategories() async {
    return await _categoriesRepository.findAll();
  }

  Future<List<PrecificationGroup>> _getPrecificationGroups() async {
    return await _precificationGroupsRepository.findAll();
  }
}
