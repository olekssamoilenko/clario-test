part of 'validation_bloc.dart';

sealed class ValidationEvent extends Equatable {
  const ValidationEvent();

  @override
  List<Object> get props => [];
}

final class EmailChanged extends ValidationEvent {
  const EmailChanged({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

final class EmailUnfocused extends ValidationEvent {}

final class PasswordChangedEvent extends ValidationEvent {
  const PasswordChangedEvent({required this.passwordValue});

  final String passwordValue;

  @override
  List<Object> get props => [passwordValue];
}

final class PasswordUnfocused extends ValidationEvent {}

final class FormSubmitted extends ValidationEvent {}
