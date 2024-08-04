import 'package:es3_proj/app/core/ui/helpers/size_extensions.dart';
import 'package:es3_proj/app/core/ui/styles/colors_app.dart';
import 'package:es3_proj/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class AttributeTile extends StatelessWidget {
  final String label;
  final String content;
  const AttributeTile({
    super.key,
    required this.content,
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
            width: context.percentWidth(.57),
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: SelectableText(
              content,
              style: context.textStyles.textLight,
            ),
          ),
        ],
      ),
    );
  }
}
