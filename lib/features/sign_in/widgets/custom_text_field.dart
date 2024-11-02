import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

import '../../../common/consts/color_consts.dart';
import '../../../common/utils/validation_utils.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool isErrorTextHidden;
  final FormzSubmissionStatus submissionStatus;
  final String initialValue;
  final String? errorText;

  const CustomTextFormField({
    super.key,
    this.controller,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.onChanged,
    this.validator,
    this.isErrorTextHidden = false,
    this.submissionStatus = FormzSubmissionStatus.initial,
    this.initialValue = '',
    this.errorText,
  });

  @override
  CustomTextFormFieldState createState() => CustomTextFormFieldState();
}

class CustomTextFormFieldState extends State<CustomTextFormField> {
  late FocusNode _focusNode;

  ///required to check if the text field is focused
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: _focusNode,
      initialValue: widget.initialValue,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: getValidationTextColor(submissionStatus: widget.submissionStatus, isFocused: _isFocused)),
        suffixIcon: widget.suffixIcon,
        fillColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
          return widget.submissionStatus == FormzSubmissionStatus.failure ? redLight1 : whiteColor;
        }),
        errorStyle: const TextStyle(fontSize: 13, color: redLight),
        errorText: widget.errorText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: getValidationColor(submissionStatus: widget.submissionStatus)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: getValidationColor(submissionStatus: widget.submissionStatus)),
        ),
      ),
      style: TextStyle(
        color: getValidationTextColor(submissionStatus: widget.submissionStatus, isFocused: _isFocused),
      ),
      cursorColor: darkColor1,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      onChanged: widget.onChanged,
      validator: widget.validator,
    );
  }
}
