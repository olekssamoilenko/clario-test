import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../common/bloc/validation_bloc/validation_bloc.dart';
import '../../../../../common/consts/color_consts.dart';
import '../../../../../features/sign_in/widgets/validator_status_widget.dart';
import '../../../../../theme/assets.dart';


class ClickedValidationWidget extends StatefulWidget {
  const ClickedValidationWidget({super.key});

  @override
  State<ClickedValidationWidget> createState() => _ClickedValidationWidget();
}

class _ClickedValidationWidget extends State<ClickedValidationWidget> {
  bool _obscurePassword = true;

  @override
  void initState() {
    ///Need this to show error right after form init
    context.read<ValidationBloc>().add(const PasswordChangedEvent(passwordValue: 'example@.com1'));
    context.read<ValidationBloc>().add(FormSubmitted());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidationBloc, ValidationState>(builder: (context, state) {
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
              fillColor: redLight1,
              filled: true,
              enabledBorder: _buildOutlineInputBorder(),
              focusedBorder: _buildOutlineInputBorder(),
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
    });
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: redLight, style: BorderStyle.solid, width: 2),
      borderRadius: BorderRadius.all(Radius.circular(30)),
    );
  }
}
