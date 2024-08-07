import 'package:es3_proj/app/core/ui/helpers/size_extensions.dart';
import 'package:es3_proj/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class BookDropdownField extends StatelessWidget {
  final String label;
  final List<DropdownMenuItem> items;
  const BookDropdownField({
    super.key,
    required this.items,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(
            label,
            style: context.textStyles.textMedium,
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: context.percentWidth(.35),
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: DropdownButtonFormField(
              value: items.first.value,
              onChanged: (value) {},
              decoration: const InputDecoration(
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
              items: items,
            ),
          ),
        ],
      ),
    );
  }
}
