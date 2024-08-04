import 'package:es3_proj/app/core/ui/helpers/size_extensions.dart';
import 'package:es3_proj/app/core/ui/styles/colors_app.dart';
import 'package:es3_proj/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class FilterWidget extends StatefulWidget {
  final List<String> categories;
  final void Function() onPressed;
  const FilterWidget({
    super.key,
    required this.onPressed,
    required this.categories,
  });

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  List<String> selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        height: context.percentHeight(.64),
        width: context.percentWidth(.25),
        child: Column(
          children: [
            SelectableText(
              "Filtrar",
              style: context.textStyles.textBold.copyWith(
                color: context.colors.secondary,
                fontSize: 22,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.black.withOpacity(.02),
              ),
              width: context.percentWidth(.3),
              height: context.percentHeight(.41),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SelectableText("Faixa de preço"),
                  RangeSlider(
                    min: 0,
                    max: 150,
                    activeColor: context.colors.secondary,
                    values: const RangeValues(0, 150),
                    onChanged: (values) {},
                  ),
                  const Text("Categoria"),
                  const SizedBox(
                    height: 5,
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
                              color:
                                  isSelected ? context.colors.secondary : null,
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
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.colors.secondary,
                  ),
                  child: const Text("Aplicar"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
