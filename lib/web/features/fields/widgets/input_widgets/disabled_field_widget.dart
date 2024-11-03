import 'package:flutter/material.dart';

class DisabledEmailField extends StatelessWidget {
  const DisabledEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: false,
      decoration: const InputDecoration(hintText: "Login"),
    );
  }
}
