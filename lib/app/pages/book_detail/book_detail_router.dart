import 'package:es3_proj/app/pages/book_detail/book_detail_controller.dart';
import 'package:es3_proj/app/pages/book_detail/book_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailRouter {
  ProductDetailRouter._();

  static Widget get page => MultiProvider(
        providers: [Provider(create: (context) => ProductDetailController())],
        builder: (context, child) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;

          return ProductDetailPage(
            book: args['book'],
          );
        },
      );
}
