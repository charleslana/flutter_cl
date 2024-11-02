import 'package:flutter_cl/models/credential.dart';
import 'package:flutter_cl/validations/lower_case_validator.dart';
import 'package:flutter_cl/validations/trim_and_not_empty_validator.dart';
import 'package:lucid_validation/lucid_validation.dart';

class CredentialValidator extends LucidValidator<Credential> {
  CredentialValidator() {
    ruleFor((entity) => entity.email, key: 'email')
        .trimAndNotEmpty(
            message: 'O campo não deve ter espaços no início ou no final')
        .onlyLowerCase(message: 'O campo deve ter apenas letras minusculas')
        .validEmail(
            message:
                'O campo deve ser um e-mail válido, exemplo: email@example.com');
    ruleFor((entity) => entity.password, key: 'password')
        .minLength(6, message: 'O campo deve conter no mínimo 6 caracteres');
  }
}
