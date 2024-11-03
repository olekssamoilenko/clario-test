import 'package:flutter/material.dart';

import '../widgets/email_fields_states_widget.dart';
import '../widgets/password_exceptions_states_widget.dart';
import '../widgets/password_fields/password_fields_states_widget.dart';
import '../widgets/text_widgets/header_text_widget.dart';
import '../widgets/text_widgets/regular_text_block.dart';

class WebFieldsScreen extends StatelessWidget {
  const WebFieldsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 50,
        ),
        HeaderTextWidget(),
        SizedBox(
          height: 92,
        ),
        EmailFieldStates(),
        SizedBox(
          height: 100,
        ),
        PasswordFieldStates(),
        SizedBox(
          height: 140,
        ),
        RegularTextBlock(),
        SizedBox(
          height: 80,
        ),
        PasswordExceptionsStates(),
        SizedBox(
          height: 80,
        ),
      ],
    );
  }
}
