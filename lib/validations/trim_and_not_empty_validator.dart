import 'package:lucid_validation/lucid_validation.dart';

extension CustomTrimAndNotEmptyValidator on SimpleValidationBuilder<String> {
  SimpleValidationBuilder<String> trimAndNotEmpty(
      {String message = 'Value cannot be empty'}) {
    return matchesPattern(
      r'^(?=\s*\S)',
      message: message,
      code: 'not_empty',
    );
  }
}
