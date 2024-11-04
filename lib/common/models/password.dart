import 'package:formz/formz.dart';

enum PasswordValidationError {
  tooShort,
  noDigit,
  noUppercase,
  noLowercase,
  invalid,
  noSpaces,
}

class Password extends FormzInput<String, Set<PasswordValidationError>> {
  const Password.pure([super.value = '']) : super.pure();

  const Password.dirty([super.value = '']) : super.dirty();

  @override
  Set<PasswordValidationError>? validator(String value) {
    final errors = <PasswordValidationError>{};

    if (value.length < 8) {
      errors.add(PasswordValidationError.tooShort);
    }
    if (value.contains(' ')) {
      errors.add(PasswordValidationError.noSpaces);
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      errors.add(PasswordValidationError.noDigit);
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      errors.add(PasswordValidationError.noUppercase);
    }

    if (!value.contains(RegExp(r'[a-z]'))) {
      errors.add(PasswordValidationError.noLowercase);
    }

    return errors.isEmpty ? null : errors;
  }

  // Helper method to check if the password is valid
  bool get isPasswordValid => error == null;

  // Helper methods to check specific validation errors
  bool get isTooShort => error?.contains(PasswordValidationError.tooShort) ?? false;

  bool get isSpaces => error?.contains(PasswordValidationError.noSpaces) ?? false;

  bool get hasNoDigit => error?.contains(PasswordValidationError.noDigit) ?? false;

  bool get hasNoUppercase => error?.contains(PasswordValidationError.noUppercase) ?? false;

  bool get hasNoLowercase => error?.contains(PasswordValidationError.noLowercase) ?? false;

  bool get hasNoSpaces => error?.contains(PasswordValidationError.noSpaces) ?? false;
}
