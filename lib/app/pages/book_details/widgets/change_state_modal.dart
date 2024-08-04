import 'package:es3_proj/app/core/ui/helpers/size_extensions.dart';
import 'package:es3_proj/app/core/ui/styles/text_styles.dart';
import 'package:es3_proj/app/pages/book_details/widgets/book_dropdown_field.dart';
import 'package:es3_proj/app/pages/book_details/widgets/book_text_form_field.dart';
import 'package:flutter/material.dart';

class ChangeStateModal extends StatelessWidget {
  const ChangeStateModal({super.key});

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
            "Desativar Livro",
            style: context.textStyles.textBold.copyWith(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const BookDropdownField(
            label: "Motivo",
            items: [
              DropdownMenuItem(
                value: "Fora de estoque",
                child: SelectableText("Fora de estoque"),
              ),
              DropdownMenuItem(
                value: "Verificação automática",
                child: SelectableText("Verificação automática"),
              ),
              DropdownMenuItem(
                value: "Decisão do vendedor",
                child: SelectableText("Decisão do vendedor"),
              ),
              DropdownMenuItem(
                value: "Conteúdo ofensivo",
                child: SelectableText("Conteúdo ofensivo"),
              ),
              DropdownMenuItem(
                value: "Baixo interesse",
                child: SelectableText("Baixo interesse"),
              ),
              DropdownMenuItem(
                value: "Violação de leis governamentais",
                child: SelectableText("Violação de leis governamentais"),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          BookTextFormField(
            label: "Descrição",
            height: context.percentHeight(.20),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 68,
            padding: const EdgeInsets.all(8.0),
            width: context.percentWidth(.38),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: SelectableText(
                'Desativar Livro',
                style: context.textStyles.textExtraBold.copyWith(fontSize: 13),
              ),
            ),
          )
        ],
      ),
    );
  }
}
