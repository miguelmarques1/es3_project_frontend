import 'package:auto_size_text/auto_size_text.dart';
import 'package:es3_proj/app/core/extensions/formatter_extension.dart';
import 'package:es3_proj/app/core/ui/helpers/size_extensions.dart';
import 'package:es3_proj/app/core/ui/styles/text_styles.dart';
import 'package:es3_proj/app/core/ui/widgets/es3_appbar.dart';
import 'package:es3_proj/app/core/ui/widgets/es3_increment_decrement_button.dart';
import 'package:es3_proj/app/models/book_model.dart';
import 'package:es3_proj/app/pages/book_detail/book_detail_controller.dart';
import 'package:es3_proj/app/pages/book_detail/widgets/attribute_tile.dart';
import 'package:es3_proj/app/pages/book_detail/widgets/change_state_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/ui/base_state/base_state.dart';

class ProductDetailPage extends StatefulWidget {
  final Book book;
  const ProductDetailPage({
    super.key,
    required this.book,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState
    extends BaseState<ProductDetailPage, ProductDetailController> {
  void showConfirmDelete(int amount) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Deseja excluir o produto?'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Cancelar',
                  style:
                      context.textStyles.textBold.copyWith(color: Colors.red),
                )),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Navigator.of(context).pop(
                  //     OrderProductDto(product: widget.product, amount: amount));
                },
                child: Text(
                  'Confirmar',
                  style: context.textStyles.textBold,
                )),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ES3AppBar(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.percentWidth(.4),
            height: context.screenHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  widget.book.urlImage,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        widget.book.title,
                        style: context.textStyles.textExtraBold
                            .copyWith(fontSize: 22),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AttributeTile(
                    content: widget.book.synopsis,
                    label: "Sinopse",
                  ),
                  AttributeTile(
                    content: widget.book.getAuthors(),
                    label: "Autores",
                  ),
                  AttributeTile(
                    content: widget.book.isbn,
                    label: "ISBN",
                  ),
                  AttributeTile(
                    content: widget.book.edition.toString(),
                    label: "Edição",
                  ),
                  AttributeTile(
                    content: widget.book.publisher,
                    label: "Editora",
                  ),
                  AttributeTile(
                    content: widget.book.year.toString(),
                    label: "Ano de lançamento",
                  ),
                  AttributeTile(
                    content: widget.book.isActive ? "Ativo" : "Inativo",
                    label: "Estado",
                  ),
                  const Divider(),
                  Row(
                    children: [
                      BlocBuilder<ProductDetailController, int>(
                        builder: (context, amount) {
                          return Container(
                              width: context.percentWidth(.2),
                              height: 68,
                              padding: const EdgeInsets.all(8),
                              child: ES3IncrementDecrementButton(
                                amount: amount,
                                decrementTap: () => context
                                    .read<ProductDetailController>()
                                    .decrement(),
                                incrementTap: () => context
                                    .read<ProductDetailController>()
                                    .increment(),
                              ));
                        },
                      ),
                      Container(
                        height: 68,
                        padding: const EdgeInsets.all(8.0),
                        width: context.percentWidth(.2),
                        child: BlocBuilder<ProductDetailController, int>(
                          builder: (context, amount) {
                            return ElevatedButton(
                              style: amount == 0
                                  ? ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red)
                                  : null,
                              onPressed: () {
                                if (amount == 0) {
                                  showConfirmDelete(amount);
                                } else {
                                  // Navigator.of(context).pop(OrderProductDto(
                                  //     product: widget.book, amount: amount));
                                }
                              },
                              child: Visibility(
                                visible: amount != 0,
                                replacement: Text(
                                  'Excluir Produto',
                                  style: context.textStyles.textExtraBold,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Adicionar',
                                      style: context.textStyles.textExtraBold
                                          .copyWith(fontSize: 13),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: AutoSizeText(
                                        (widget.book.aquisitionPrice * amount)
                                            .currencyPTBR,
                                        maxFontSize: 13,
                                        minFontSize: 5,
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        style: context.textStyles.textExtraBold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        height: 68,
                        padding: const EdgeInsets.all(8.0),
                        width: context.percentWidth(.2),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: const ChangeStateModal(),
                                );
                              },
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Desativar Livro',
                                style: context.textStyles.textExtraBold
                                    .copyWith(fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
