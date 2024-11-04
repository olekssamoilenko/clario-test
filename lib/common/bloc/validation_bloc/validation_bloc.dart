import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../models/email.dart';
import '../../models/password.dart';



part 'validation_event.dart';
part 'validation_state.dart';

class ValidationBloc extends Bloc<ValidationEvent, ValidationState> {
  ValidationBloc() : super(const ValidationState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChangedEvent>(_onPasswordChanged);

    on<FormSubmitted>(_onFormSubmitted);
  }

  void _onEmailChanged(EmailChanged event, Emitter<ValidationState> emit) {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email, state.password]),
        emailStatus: FormzSubmissionStatus.initial,
        formStatus: FormzSubmissionStatus.initial,
      ),
    );
  }

  void _onPasswordChanged(PasswordChangedEvent event, Emitter<ValidationState> emit) {
    final password = Password.dirty(event.passwordValue);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([state.email, password]),
        passwordStatus: FormzSubmissionStatus.initial,
        formStatus: FormzSubmissionStatus.initial,
      ),
    );
  }

  Future<void> _onFormSubmitted(FormSubmitted event, Emitter<ValidationState> emit) async {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);

    final isEmailValid = email.isValid;
    final isPasswordValid = password.isPasswordValid;

    emit(
      state.copyWith(
        email: email,
        password: password,
        isValid: isEmailValid && isPasswordValid,
        isSubmitted: true,
        emailStatus: isEmailValid ? FormzSubmissionStatus.success : FormzSubmissionStatus.failure,
        passwordStatus: isPasswordValid ? FormzSubmissionStatus.success : FormzSubmissionStatus.failure,
        formStatus: FormzSubmissionStatus.inProgress,
      ),
    );

    if (state.isValid) {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(state.copyWith(formStatus: FormzSubmissionStatus.success));
      emit(state.copyWith(passwordStatus: FormzSubmissionStatus.success));
      emit(state.copyWith(emailStatus: FormzSubmissionStatus.success));
    } else {
      emit(state.copyWith(formStatus: FormzSubmissionStatus.failure));
    }
  }
}
