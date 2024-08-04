import 'package:es3_proj/app/core/ui/helpers/size_extensions.dart';
import 'package:es3_proj/app/core/ui/styles/colors_app.dart';
import 'package:es3_proj/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class CategoryForm extends StatefulWidget {
  final List<String> categories;
  const CategoryForm({
    super.key,
    required this.categories,
  });

  @override
  State<CategoryForm> createState() => _CategoryFormState();
}

class _CategoryFormState extends State<CategoryForm> {
  List<String> selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.percentWidth(.35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Categoria(s)",
            style: context.textStyles.textMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Wrap(
              children: widget.categories.map<Widget>((category) {
                bool isSelected = selectedOptions.contains(category);
                return InkWell(
                  onTap: () => setState(() {
                    isSelected
                        ? selectedOptions.remove(category)
                        : selectedOptions.add(category);
                  }),
                  child: Container(
                    margin: const EdgeInsets.only(right: 2, bottom: 2),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: isSelected ? context.colors.secondary : null,
                      border: Border.all(
                        color: isSelected
                            ? context.colors.secondary
                            : Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                    child: Text(
                      category,
                      style: context.textStyles.textMedium.copyWith(
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
