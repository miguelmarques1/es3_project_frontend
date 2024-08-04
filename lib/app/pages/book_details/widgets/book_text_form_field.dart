import 'package:es3_proj/app/core/ui/helpers/size_extensions.dart';
import 'package:es3_proj/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BookTextFormField extends StatelessWidget {
  final double? height;
  final String label;
  final List<TextInputFormatter>? inputFormatters;
  const BookTextFormField({
    super.key,
    required this.label,
    this.height,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: context.textStyles.textMedium,
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: context.percentWidth(.35),
            padding: const EdgeInsets.all(7),
            height: height,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              inputFormatters: inputFormatters,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
