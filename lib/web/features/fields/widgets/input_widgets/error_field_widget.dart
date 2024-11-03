import 'package:flutter/material.dart';

import '../../../../../common/consts/color_consts.dart';

class ErrorEmailField extends StatelessWidget {
  final ValueNotifier<bool> isErrorNotifier;
  final TextEditingController emailController;
  final String? Function(String?) validateEmail;

  const ErrorEmailField({
    super.key,
    required this.isErrorNotifier,
    required this.emailController,
    required this.validateEmail,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isErrorNotifier,
      builder: (context, isError, _) {
        return TextFormField(
          controller: emailController,
          decoration: InputDecoration(
            fillColor: isError ? redLight1 : whiteColor,
            filled: true,
          ),
          validator: validateEmail,
        );
      },
    );
  }
}