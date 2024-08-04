import 'dart:convert';

import 'package:intl/intl.dart';

import 'package:es3_proj/app/models/author_model.dart';
import 'package:es3_proj/app/models/dimensions_model.dart';
import 'package:es3_proj/app/models/group_pricing_model.dart';

import 'category_model.dart';

class Book {
  Book({
    this.id,
    required this.isActive,
    required this.title,
    required this.year,
    required this.urlImage,
    required this.authors,
    required this.categories,
    required this.code,
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

  int? id;
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
  final PrecificationGroup groupPricing;
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

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'],
      isActive: map['state'] == 1,
      title: map['title'] ?? '',
      year: map['year']?.toInt() ?? 0,
      urlImage: map['urlImage'] ?? '',
      authors: List<Author>.from(map['authors']?.map((x) => Author.fromMap(x)) ?? const []),
      categories: List<Category>.from(map['categories']?.map((x) => Category.fromMap(x)) ?? const []),
      code: map['code'] ?? '',
      codeBar: map['codeBar'] ?? '',
      pages: map['pages']?.toInt() ?? 0,
      synopsis: map['synopsis'] ?? '',
      dimensions: Dimensions.fromMap(map['dimensions']),
      manufactoringCosts: map['manufactoringCosts']?.toDouble() ?? 0.0,
      groupPricing: PrecificationGroup.fromMap(map['groupPricing']),
      aquisitionPrice: map['aquisitionPrice']?.toDouble() ?? 0.0,
      publisher: map['publisher'] ?? '',
      edition: map['edition']?.toInt() ?? 0,
      isbn: map['isbn'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Book.fromJson(String source) => Book.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Book(title: $title, year: $year, urlImage: $urlImage, authors: $authors, categories: $categories, code: $code, codeBar: $codeBar, pages: $pages, synopsis: $synopsis, dimensions: $dimensions, manufactoringCosts: $manufactoringCosts, groupPricing: $groupPricing, aquisitionPrice: $aquisitionPrice, publisher: $publisher, edition: $edition, isbn: $isbn)';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'state': isActive ? 1 : 0,
      'title': title,
      'year': year,
      'urlImage': urlImage,
      'authors': authors.map((x) => x.toMap()).toList(),
      'categories': categories.map((x) => x.toMap()).toList(),
      'code': code,
      'codeBar': codeBar,
      'pages': pages,
      'synopsis': synopsis,
      'dimensions': dimensions.toMap(),
      'manufactoringCosts': manufactoringCosts,
      'groupPricing': groupPricing.toMap(),
      'aquisitionPrice': aquisitionPrice,
      'publisher': publisher,
      'edition': edition,
      'isbn': isbn,
    };
  }
}
