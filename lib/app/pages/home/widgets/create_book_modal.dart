import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:es3_proj/app/core/extensions/input_formatter_extension.dart';
import 'package:es3_proj/app/core/ui/helpers/size_extensions.dart';
import 'package:es3_proj/app/core/ui/styles/colors_app.dart';
import 'package:es3_proj/app/core/ui/styles/text_styles.dart';
import 'package:es3_proj/app/pages/book_details/widgets/book_dropdown_field.dart';
import 'package:es3_proj/app/pages/book_details/widgets/book_text_form_field.dart';
import 'package:es3_proj/app/pages/home/widgets/book_image_form_field.dart';
import 'package:es3_proj/app/pages/home/widgets/category_form.dart';
import 'package:flutter/material.dart';

class CreateBookModal extends StatefulWidget {
  final List<String> categories;
  final List<String> precificationGroups;

  const CreateBookModal({
    super.key,
    required this.categories,
    required this.precificationGroups,
  });

  @override
  State<CreateBookModal> createState() => _CreateBookModalState();
}

class _CreateBookModalState extends State<CreateBookModal> {
  final currencyInputFormatter = CurrencyTextInputFormatter(locale: 'pt_BR');

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.percentHeight(.74),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 30,
      ),
      child: Column(
        children: [
          SelectableText(
            "Criar Livro",
            style: context.textStyles.textBold.copyWith(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: context.percentHeight(.4),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const BookImageFormField(),
                  const SizedBox(
                    height: 10,
                  ),
                  const BookTextFormField(
                    label: "Nome do livro",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BookTextFormField(
                    label: "Sinopse",
                    height: context.percentHeight(.20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CategoryForm(categories: widget.categories),
                  const SizedBox(
                    height: 10,
                  ),
                  const BookTextFormField(label: "Autores"),
                  const SizedBox(
                    height: 10,
                  ),
                  BookTextFormField(
                    label: "ISBN",
                    inputFormatters: [
                      context.inputFormatters.isbnInputFormatter
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const BookTextFormField(label: "Editora"),
                  const SizedBox(
                    height: 10,
                  ),
                  BookTextFormField(
                    label: "Edição",
                    inputFormatters: [
                      context.inputFormatters.editionInputFormatter
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BookTextFormField(
                    label: "Custo para Produção",
                    inputFormatters: [
                      context.inputFormatters.currencyInputFormatter
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BookDropdownField(
                      items: widget.precificationGroups
                          .map<DropdownMenuItem>(
                            (precificationGroup) => DropdownMenuItem(
                              value: precificationGroup,
                              child: Text(precificationGroup),
                            ),
                          )
                          .toList(),
                      label: "Grupo de Precificação"),
                  const SizedBox(
                    height: 10,
                  ),
                  BookTextFormField(
                    label: "Preço",
                    inputFormatters: [
                      context.inputFormatters.currencyInputFormatter,
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 68,
            padding: const EdgeInsets.all(8.0),
            width: context.percentWidth(.38),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: context.colors.primary,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: SelectableText(
                'Criar livro',
                style: context.textStyles.textExtraBold.copyWith(fontSize: 13),
              ),
            ),
          )
        ],
      ),
    );
  }
}
