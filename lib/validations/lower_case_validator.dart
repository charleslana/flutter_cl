import 'package:lucid_validation/lucid_validation.dart';

extension CustomLowerCaseValidator on SimpleValidationBuilder<String> {
  SimpleValidationBuilder<String> onlyLowerCase(
      {String message = 'Value must be in lower case'}) {
    return matchesPattern(
      r'^[a-z0-9!#$%&@. *+/=?^_`{|}~-]*$',
      message: message,
      code: 'only_lower_case',
    );
  }
}
