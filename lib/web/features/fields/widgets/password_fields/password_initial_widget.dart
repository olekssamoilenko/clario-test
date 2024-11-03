import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../common/bloc/validation_bloc/validation_bloc.dart';
import '../../../../../features/sign_in/widgets/validator_status_widget.dart';
import '../../../../../theme/assets.dart';



class PasswordInitialWidget extends StatefulWidget {
  const PasswordInitialWidget({super.key});

  @override
  State<PasswordInitialWidget> createState() => _PasswordInitialWidgetState();
}

class _PasswordInitialWidgetState extends State<PasswordInitialWidget> {

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ValidationBloc(),
      child: BlocBuilder<ValidationBloc, ValidationState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                initialValue: 'example@.com1',
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  hintText: "Create a password",
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
      ),
    );
  }
}
