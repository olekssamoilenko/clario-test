import 'package:flutter/material.dart';
import 'package:simple_grid/simple_grid.dart';

import '../../../../common/utils/app_utils.dart';
import 'input_widgets/disabled_field_widget.dart';
import 'input_widgets/error_field_widget.dart';
import 'input_widgets/focused_field_widget.dart';
import 'input_widgets/initial_field_widget.dart';

class EmailFieldStates extends StatefulWidget {
  const EmailFieldStates({super.key});

  @override
  State<EmailFieldStates> createState() => _EmailFieldStatesState();
}

class _EmailFieldStatesState extends State<EmailFieldStates> {
  final _formKey = GlobalKey<FormState>();
  late final FocusNode _focusNode;
  final _isErrorNotifier = ValueNotifier<bool>(false);
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode()..requestFocus();
    _emailController = TextEditingController(text: 'Example.com');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _formKey.currentState?.validate();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _isErrorNotifier.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: SpGrid(
        width: MediaQuery.of(context).size.width,
        spacing: 10,
        runSpacing: 10,
        children: [
          buildSpGridItem(
            context,
            label: 'Initial',
            child: const InitialEmailField(),
          ),
          buildSpGridItem(
            context,
            label: 'Focused',
            child: FocusedEmailField(focusNode: _focusNode),
          ),
          buildSpGridItem(
            context,
            label: 'Error',
            child: ErrorEmailField(
              isErrorNotifier: _isErrorNotifier,
              emailController: _emailController,
              validateEmail: _validateEmail,
            ),
          ),
          buildSpGridItem(
            context,
            label: 'Disabled',
            child: const DisabledEmailField(),
          ),
        ],
      ),
    );
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      _isErrorNotifier.value = true;
      return 'Please enter your email';
    }
    if (!value.contains('@')) {
      _isErrorNotifier.value = true;
      return 'Please enter a valid email';
    }
    _isErrorNotifier.value = false;
    return null;
  }
}
