import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_demo/features/sign_in/widgets/validation_status_text.dart';
import 'package:formz/formz.dart';

import '../../../common/bloc/validation_bloc/validation_bloc.dart';
import 'custom_text_field.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidationBloc, ValidationState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
              initialValue: state.email.value,
              hintText: 'Email',
              submissionStatus: state.emailStatus,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                context.read<ValidationBloc>().add(EmailChanged(email: value));
              },
            ),
            if (state.emailStatus == FormzSubmissionStatus.failure)
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: ValidationStatusText(
                  isValid: false,
                  text: 'Please ensure the email entered is valid',
                  isSubmitted: state.isSubmitted,
                ),
              ),
          ],
        );
      },
    );
  }
}
