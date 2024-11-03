import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../common/bloc/validation_bloc/validation_bloc.dart';
import '../../../../../features/sign_in/widgets/validator_status_widget.dart';
import '../../../../../theme/assets.dart';

class RealtimeValidationWidget extends StatefulWidget {
  const RealtimeValidationWidget({super.key});

  @override
  State<RealtimeValidationWidget> createState() => _RealtimeValidationWidget();
}

class _RealtimeValidationWidget extends State<RealtimeValidationWidget> {
  bool _obscurePassword = true;

  @override
  void initState() {
    context.read<ValidationBloc>().add(const PasswordChangedEvent(passwordValue: 'example@.com1'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidationBloc, ValidationState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              initialValue: 'example@.com1',
              obscureText: _obscurePassword,
              onChanged: (password) {
                context.read<ValidationBloc>().add(PasswordChangedEvent(passwordValue: password));
              },
              decoration: InputDecoration(
                hintText: "Login",
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(
                    _obscurePassword ? hidePassword : showPassword,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            const ValidationStatusWidget(),
            const SizedBox(height: 40),
          ],
        );
      },
    );
  }
}
