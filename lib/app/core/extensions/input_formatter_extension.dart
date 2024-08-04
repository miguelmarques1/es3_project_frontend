import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputFormatters {
  static InputFormatters? _instance;

  InputFormatters._();

  static InputFormatters get i {
    _instance ??= InputFormatters._();
    return _instance!;
  }

  TextInputFormatter get currencyInputFormatter =>
      CurrencyTextInputFormatter(locale: 'pt_BR', symbol: "R\$");

  TextInputFormatter get isbnInputFormatter =>
      MaskTextInputFormatter(mask: "ISBN ###-#-####-####-#");

  TextInputFormatter get editionInputFormatter =>
      MaskTextInputFormatter(mask: "##°");
}

extension InputFormattersExtension on BuildContext {
  InputFormatters get inputFormatters => InputFormatters.i;
}
