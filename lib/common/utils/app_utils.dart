import 'package:flutter/material.dart';

import '../../theme/theme.dart';

Color setValidationColor({required bool isValid, required bool isSubmitted}) {
  Color color = darkColor1;
  if (isSubmitted) {
    color = isValid ? greenColor : redLight;
  } else if (isValid) {
    color = greenColor;
  }

  return color;
}
void showSuccessSnackBar(
    BuildContext context,
    ) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Sign up success'),
      backgroundColor: greenColor,
      behavior: SnackBarBehavior.floating,
    ),
  );
}
