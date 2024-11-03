import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_demo/web/features/fields/widgets/password_initial_widget.dart';
import 'package:form_demo/web/features/fields/widgets/realtime_validation_widget.dart';
import 'package:simple_grid/simple_grid.dart';


import '../../../../common/bloc/validation_bloc/validation_bloc.dart';
import '../../../../common/utils/app_utils.dart';
import 'clicked_validation_widget.dart';

class PasswordExceptionsStates extends StatelessWidget {
  const PasswordExceptionsStates({
    super.key,
  });

  static final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SpGrid(
        width: MediaQuery.of(context).size.width,
        spacing: 10,
        runSpacing: 10,
        children: [
          buildSpGridItem(
            context,
            label: 'Password initial',
            child: const PasswordInitialWidget(),
          ),
          buildSpGridItem(
            context,
            label: 'Real-time validation',
            child: BlocProvider(
              create: (context) => ValidationBloc(),
              child: const RealtimeValidationWidget(),
            ),
          ),
          buildSpGridItem(
            context,
            label: 'User clicked on CTA',
            child: const ClickedValidationWidget(),
          ),
        ],
      ),
    );
  }
}
