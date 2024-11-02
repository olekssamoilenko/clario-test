import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_demo/features/sign_in/widgets/validator_status_widget.dart';

import '../../../common/bloc/validation_bloc/validation_bloc.dart';
import '../../../common/utils/validation_utils.dart';
import '../../../theme/assets.dart';
import 'custom_text_field.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({super.key});

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidationBloc, ValidationState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
              hintText: 'Create your password',
              obscureText: _obscurePassword,
              isErrorTextHidden: true,
              submissionStatus: state.passwordStatus,
              suffixIcon: IconButton(
                icon: SvgPicture.asset(
                  _obscurePassword ? hidePassword : showPassword,
                  colorFilter: ColorFilter.mode(getValidationColor(submissionStatus: state.passwordStatus), BlendMode.srcIn),
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
              onChanged: (password) {
                context.read<ValidationBloc>().add(PasswordChangedEvent(passwordValue: password));
              },
            ),
            const SizedBox(height: 20),
            const ValidationStatusWidget(),
            const SizedBox(height: 40),
          ],
        );
      },
    );
  }
}
