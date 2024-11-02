part of 'validation_bloc.dart';

final class ValidationState extends Equatable {
  const ValidationState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.isValid = false,
    this.isSubmitted = false,
    this.emailStatus = FormzSubmissionStatus.initial,
    this.passwordStatus = FormzSubmissionStatus.initial,
    this.formStatus = FormzSubmissionStatus.initial,
  });

  final Email email;
  final Password password;
  final bool isValid;
  final bool isSubmitted;
  final FormzSubmissionStatus emailStatus;
  final FormzSubmissionStatus passwordStatus;
  final FormzSubmissionStatus formStatus;

  ValidationState copyWith({
    Email? email,
    Password? password,
    bool? isValid,
    bool? isSubmitted,
    FormzSubmissionStatus? emailStatus,
    FormzSubmissionStatus? passwordStatus,
    FormzSubmissionStatus? formStatus,
  }) {
    return ValidationState(
      email: email ?? this.email,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
      isSubmitted: isSubmitted ?? this.isSubmitted,
      emailStatus: emailStatus ?? this.emailStatus,
      passwordStatus: passwordStatus ?? this.passwordStatus,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  @override
  List<Object> get props => [email, password, isValid, isSubmitted, emailStatus, passwordStatus, formStatus];
}