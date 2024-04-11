// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:es3_proj/app/models/book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

part 'home_state.g.dart';

@match
enum HomeStateStatus { initial, loading, loaded, error }

class HomeState extends Equatable {
  final HomeStateStatus status;
  final List<Book> books;
  final String? errorMessage;
  const HomeState({
    required this.status,
    required this.books,
    this.errorMessage,
  });

  const HomeState.initial()
      : status = HomeStateStatus.initial,
        books = const [],
        errorMessage = null;

  @override
  List<Object?> get props => [status, books, errorMessage];

  HomeState copyWith({
    HomeStateStatus? status,
    List<Book>? books,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      books: books ?? this.books,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
