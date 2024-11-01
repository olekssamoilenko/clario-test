part of 'password_validation_bloc.dart';

sealed class PasswordValidationState extends Equatable {
  const PasswordValidationState();

  @override
  List<Object?> get props => [];
}

final class PasswordValid extends PasswordValidationState {
  const PasswordValid();

  @override
  List<Object?> get props => [];
}

final class PasswordInvalid extends PasswordValidationState {
  final ValidationStatus status;

  const PasswordInvalid({
    required this.status,
  });

  @override
  List<Object?> get props => [status];
}

final class PasswordEmpty extends PasswordValidationState {
  const PasswordEmpty();
}


//todo: move to utils

//validation status model
class ValidationStatus extends Equatable {
  final bool hasMinLength;
  final bool hasUppercase;
  final bool hasLowercase;
  final bool hasDigit;
  final bool hasNoSpaces;

  const ValidationStatus({
    required this.hasMinLength,
    required this.hasUppercase,
    required this.hasLowercase,
    required this.hasDigit,
    required this.hasNoSpaces,
  });

  ValidationStatus copyWith({
    bool? hasMinLength,
    bool? hasUppercase,
    bool? hasLowercase,
    bool? hasDigit,
    bool? hasNoSpaces,
  }) {
    return ValidationStatus(
      hasMinLength: hasMinLength ?? this.hasMinLength,
      hasUppercase: hasUppercase ?? this.hasUppercase,
      hasLowercase: hasLowercase ?? this.hasLowercase,
      hasDigit: hasDigit ?? this.hasDigit,
      hasNoSpaces: hasNoSpaces ?? this.hasNoSpaces,
    );
  }

  @override
  List<Object?> get props => [
    hasMinLength,
    hasUppercase,
    hasLowercase,
    hasDigit,
    hasNoSpaces,
  ];
}
