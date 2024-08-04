import 'dart:js_interop';

import 'package:es3_proj/app/core/ui/helpers/size_extensions.dart';
import 'package:es3_proj/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';

class BookImageFormField extends StatefulWidget {
  const BookImageFormField({super.key});

  @override
  State<BookImageFormField> createState() => _BookImageFormFieldState();
}

class _BookImageFormFieldState extends State<BookImageFormField> {
  String? imageName;

  getImage() async {
    final image = await ImagePickerWeb.getImageAsFile();
    if (image.isDefinedAndNotNull) {
      imageName = image!.name;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(
            "Imagem",
            style: context.textStyles.textMedium,
          ),
          const SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: getImage,
            child: Container(
                width: context.percentWidth(.35),
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.image),
                    const SizedBox(
                      height: 20,
                      child: VerticalDivider(
                        color: Colors.black,
                      ),
                    ),
                    Text(imageName ?? "Selecione a imagem"),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
