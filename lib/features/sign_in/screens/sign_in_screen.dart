import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_demo/common/widgets/gradient_button.dart';
import 'package:formz/formz.dart';

import '../../../common/bloc/validation_bloc/validation_bloc.dart';
import '../../../common/consts/color_consts.dart';
import '../widgets/email_input_widget.dart';
import '../widgets/password_input_widget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ValidationBloc, ValidationState>(
      listener: (context, state) {
        if (state.formStatus.isSuccess) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('Sign up success'),
                backgroundColor: greenColor,
                behavior: SnackBarBehavior.floating,
              ),
            );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const EmailInput(),
          const SizedBox(height: 20),
          const PasswordInput(),
          GradientButton(
            text: 'Sign up',
            onPressed: () => context.read<ValidationBloc>().add(FormSubmitted()),
          ),
        ],
      ),
    );
  }
}
