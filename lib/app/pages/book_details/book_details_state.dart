// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:es3_proj/app/models/book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

part 'book_details_state.g.dart';

@match
enum BookDetailsStateStatus { initial, loading, loaded, error }

class BookDetailsState extends Equatable {
  final BookDetailsStateStatus status;
  final Book? book;
  final int amount;
  final String? errorMessage;
  const BookDetailsState({
    required this.status,
    required this.book,
    required this.amount,
    this.errorMessage,
  });

  const BookDetailsState.initial()
      : status = BookDetailsStateStatus.initial,
        book = null,
        amount = 1,
        errorMessage = null;

  @override
  List<Object?> get props => [status, book, errorMessage, amount];

  BookDetailsState copyWith({
    BookDetailsStateStatus? status,
    Book? book,
    int? amount,
    String? errorMessage,
  }) {
    return BookDetailsState(
      status: status ?? this.status,
      book: book ?? this.book,
      amount: amount ?? this.amount,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
