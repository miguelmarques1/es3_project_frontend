import 'package:auto_size_text/auto_size_text.dart';
import 'package:es3_proj/app/core/extensions/formatter_extension.dart';
import 'package:es3_proj/app/core/ui/helpers/size_extensions.dart';
import 'package:es3_proj/app/core/ui/styles/text_styles.dart';
import 'package:es3_proj/app/core/ui/widgets/es3_appbar.dart';
import 'package:es3_proj/app/core/ui/widgets/es3_increment_decrement_button.dart';
import 'package:es3_proj/app/models/book_model.dart';
import 'package:es3_proj/app/pages/book_details/book_details_controller.dart';
import 'package:es3_proj/app/pages/book_details/book_details_state.dart';
import 'package:es3_proj/app/pages/book_details/widgets/attribute_tile.dart';
import 'package:es3_proj/app/pages/book_details/widgets/change_state_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/ui/base_state/base_state.dart';

class BookDetailsPage extends StatefulWidget {
  final int bookId;
  const BookDetailsPage({
    super.key,
    required this.bookId,
  });

  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState
    extends BaseState<BookDetailsPage, BookDetailsController> {
  void showConfirmDelete(int amount) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const SelectableText('Deseja excluir o produto?'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: SelectableText(
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
                child: SelectableText(
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
      body: BlocConsumer<BookDetailsController, BookDetailsState>(
        listener: (context, state) {
          state.status.matchAny(
            loading: () => showLoader(),
            any: () => hideLoader(),
            error: () {
              showError(state.errorMessage ?? 'Erro não informado');
            },
          );
        },
        buildWhen: (previous, current) => current.status.matchAny(
          any: () => false,
          initial: () => true,
          loaded: () => true,
        ),
        builder: (context, state) {
          final book = state.book;
          if (book == null) {
            return Container();
          }
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: context.percentWidth(.4),
                height: context.screenHeight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      book.urlImage,
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
                          child: SelectableText(
                            book.title,
                            style: context.textStyles.textExtraBold
                                .copyWith(fontSize: 22),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AttributeTile(
                        content: book.synopsis,
                        label: "Sinopse",
                      ),
                      AttributeTile(
                        content: book.getAuthors(),
                        label: "Autores",
                      ),
                      AttributeTile(
                        content: book.isbn,
                        label: "ISBN",
                      ),
                      AttributeTile(
                        content: book.edition.toString(),
                        label: "Edição",
                      ),
                      AttributeTile(
                        content: book.publisher,
                        label: "Editora",
                      ),
                      AttributeTile(
                        content: book.year.toString(),
                        label: "Ano de lançamento",
                      ),
                      AttributeTile(
                        content: book.isActive ? "Ativo" : "Inativo",
                        label: "Estado",
                      ),
                      const Divider(),
                      Row(
                        children: [
                          Container(
                            width: context.percentWidth(.194),
                            height: 68,
                            padding: const EdgeInsets.all(8),
                            child: ES3IncrementDecrementButton(
                              amount: state.amount,
                              decrementTap: () => context
                                  .read<BookDetailsController>()
                                  .decrement(),
                              incrementTap: () => context
                                  .read<BookDetailsController>()
                                  .increment(),
                            ),
                          ),
                          Container(
                            height: 68,
                            padding: const EdgeInsets.all(8.0),
                            width: context.percentWidth(.194),
                            child: ElevatedButton(
                              style: state.amount == 0
                                  ? ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red)
                                  : null,
                              onPressed: () {
                                if (state.amount == 0) {
                                  showConfirmDelete(state.amount);
                                } else {
                                  // Navigator.of(context).pop(OrderProductDto(
                                  //     product: widget.book, amount: amount));
                                }
                              },
                              child: Visibility(
                                visible: state.amount != 0,
                                replacement: SelectableText(
                                  'Excluir Produto',
                                  style: context.textStyles.textExtraBold,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SelectableText(
                                      'Adicionar',
                                      style: context.textStyles.textExtraBold
                                          .copyWith(fontSize: 13),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: AutoSizeText(
                                        (book.aquisitionPrice * state.amount)
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
                            ),
                          ),
                          Container(
                            height: 68,
                            padding: const EdgeInsets.all(8.0),
                            width: context.percentWidth(.194),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
          );
        },
      ),
    );
  }

  @override
  void onReady() {
    super.onReady();
    context.read<BookDetailsController>().loadBook(widget.bookId);
  }
}
