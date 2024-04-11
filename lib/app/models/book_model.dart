import 'package:es3_proj/app/models/author_model.dart';
import 'package:es3_proj/app/models/dimensions_model.dart';
import 'package:es3_proj/app/models/group_pricing_model.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class Book {
  Book({
    required this.id,
    required this.title,
    required this.year,
    required this.urlImage,
    required this.authors,
    required this.categories,
    required this.code,
    required this.isActive,
    required this.codeBar,
    required this.pages,
    required this.synopsis,
    required this.dimensions,
    required this.manufactoringCosts,
    required this.groupPricing,
    required this.aquisitionPrice,
    required this.publisher,
    required this.edition,
    required this.isbn,
  });

  final int id;
  final String title;
  final int year;
  final String urlImage;
  final List<Author> authors;
  final List<Category> categories;
  final String code;
  bool isActive;
  final String codeBar;
  final int pages;
  final String synopsis;
  final Dimensions dimensions;
  final double manufactoringCosts;
  final GroupPricing groupPricing;
  final double aquisitionPrice;
  final String publisher;
  final int edition;
  final String isbn;

  String getFormattedPrice() {
    final formatter = NumberFormat.currency(locale: "pt_BR");
    return formatter.format(aquisitionPrice).replaceAll("BRL", "");
  }

  String getAuthors() {
    List<String> authorsName =
        authors.map<String>((author) => author.name).toList();
    return authorsName.join(", ");
  }
}
