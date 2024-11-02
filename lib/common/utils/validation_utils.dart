import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

import '../consts/color_consts.dart';

//determine validation status for color states
Color getValidationColor({required FormzSubmissionStatus submissionStatus, bool isFocused = false}) {
  if (!isFocused && submissionStatus == FormzSubmissionStatus.initial) {
    return lightGreyColor1;
  }

  switch (submissionStatus) {
    case FormzSubmissionStatus.success:
      return greenColor;
    case FormzSubmissionStatus.failure:
      return redLight;
    case FormzSubmissionStatus.initial:
    default:
      return lightGreyColor1;
  }
}

//determine validation  text color
Color getValidationTextColor({
  required FormzSubmissionStatus submissionStatus,
  bool isFocused = false,
}) {
  switch (submissionStatus) {
    case FormzSubmissionStatus.initial:
      return isFocused ? darkColor1 : lightGreyColor1;
    case FormzSubmissionStatus.success:
      return greenColor;
    case FormzSubmissionStatus.failure:
      return redLight;
    default:
      return darkColor1;
  }
}

Color setTextValidationColor({
  required bool isValid,
  required bool isSubmitted,
}) {
  if (!isSubmitted) {
    return isValid ? greenColor : darkColor1;
  }

  return isValid ? greenColor : redLight;
}
