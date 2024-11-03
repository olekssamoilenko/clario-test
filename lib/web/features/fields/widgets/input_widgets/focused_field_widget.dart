import 'package:flutter/material.dart';

class FocusedEmailField extends StatelessWidget {
  final FocusNode focusNode;

  const FocusedEmailField({super.key, required this.focusNode});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      decoration: const InputDecoration(hintText: "Login"),
    );
  }
}
