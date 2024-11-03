import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_demo/features/sign_in/widgets/validation_status_text.dart';

import '../../../common/bloc/validation_bloc/validation_bloc.dart';
import '../models/validation_item_model.dart';

class ValidationStatusWidget extends StatelessWidget {
  const ValidationStatusWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidationBloc, ValidationState>(
      builder: (context, state) {
        final validationItems = [
          ValidationItem(
            isValid: !state.password.isTooShort && !state.password.hasNoSpaces,
            text: '8 characters or more (no spaces)',
          ),
          ValidationItem(
            isValid: !state.password.hasNoLowercase && !state.password.hasNoUppercase,
            text: 'Uppercase and lowercase letters',
          ),
          ValidationItem(
            isValid: !state.password.hasNoDigit,
            text: 'At least one digit',
          ),
        ];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: validationItems
                .map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ValidationStatusText(
                      isValid: item.isValid,
                      text: item.text,
                      isSubmitted: state.isSubmitted,
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
