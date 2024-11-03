import 'package:flutter/material.dart';

import '../../../../../common/consts/color_consts.dart';

class InitialEmailField extends StatelessWidget {
  const InitialEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Login",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: darkColor2.withOpacity(0.2), width: 2),
        ),
      ),
    );
  }
}