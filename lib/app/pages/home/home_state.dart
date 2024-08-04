// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:es3_proj/app/models/book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:es3_proj/app/models/category_model.dart';
import 'package:es3_proj/app/models/group_pricing_model.dart';
import 'package:match/match.dart';

part 'home_state.g.dart';

@match
enum HomeStateStatus { initial, loading, loaded, error }

class HomeState extends Equatable {
  final HomeStateStatus status;
  final List<Book> books;
  final List<Category>? categories;
  final List<PrecificationGroup>? precificationGroups;
  final String? errorMessage;
  const HomeState({
    required this.status,
    required this.books,
    this.categories,
    this.precificationGroups,
    this.errorMessage,
  });

  const HomeState.initial()
      : status = HomeStateStatus.initial,
        books = const [],
        categories = null,
        precificationGroups = null,
        errorMessage = null;

  @override
  List<Object?> get props => [status, books, errorMessage];

  HomeState copyWith({
    HomeStateStatus? status,
    List<Book>? books,
    List<Category>? categories,
    List<PrecificationGroup>? precificationGroups,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      books: books ?? this.books,
      categories: categories ?? this.categories,
      precificationGroups: precificationGroups ?? this.precificationGroups,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
