import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'password_validation_event.dart';
part 'password_validation_state.dart';

class PasswordValidationBloc extends Bloc<PasswordValidationEvent, PasswordValidationState> {
  PasswordValidationBloc() : super(const PasswordEmpty()) {
    on<PasswordChanged>(_onPasswordChanged);
  }

  void _onPasswordChanged(
    PasswordChanged event,
    Emitter<PasswordValidationState> emit,
  ) {
    final password = event.password;

    if (password.isEmpty) {
      emit(const PasswordEmpty());
      return;
    }
    final status = setValidationStatus(password);

    if (status.hasMinLength && status.hasUppercase && status.hasLowercase && status.hasDigit && status.hasNoSpaces) {
      emit(const PasswordValid());
    } else {
      emit(PasswordInvalid(status: status));
    }
  }
}
//todo: move to utils
ValidationStatus setValidationStatus(String password) {
  return ValidationStatus(
    hasMinLength: password.length >= 8,
    hasUppercase: password.contains(RegExp(r'[A-Z]')),
    hasLowercase: password.contains(RegExp(r'[a-z]')),
    hasDigit: password.contains(RegExp(r'[0-9]')),
    hasNoSpaces: !password.contains(' '),
  );
}