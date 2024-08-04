import 'package:es3_proj/app/core/extensions/formatter_extension.dart';
import 'package:es3_proj/app/core/ui/helpers/size_extensions.dart';
import 'package:es3_proj/app/core/ui/styles/colors_app.dart';
import 'package:es3_proj/app/core/ui/styles/text_styles.dart';
import 'package:es3_proj/app/models/book_model.dart';
import 'package:flutter/material.dart';

class BookTile extends StatelessWidget {
  final Book book;
  const BookTile({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          '/bookDetails/${book.id}',
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Column(
          children: [
            FadeInImage.assetNetwork(
              placeholder: 'assets/images/loading.gif',
              width: 100,
              height: 100,
              image: book.urlImage,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                book.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: context.textStyles.textExtraBold.copyWith(
                  fontSize: 12,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                book.synopsis,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: context.textStyles.textRegular.copyWith(fontSize: 8),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                book.aquisitionPrice.currencyPTBR,
                style: context.textStyles.textMedium.copyWith(
                  fontSize: 10,
                  color: context.colors.secondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
